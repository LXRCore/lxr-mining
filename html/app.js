/* LXR-MINING — the vein card | © 2026 iBoss21 / LXRCore */
(function () {
  const $ = (id) => document.getElementById(id);
  const card = $('card');
  let L = {};
  const t = (k, vars) => { let s = L[k] || k.split('.').pop().replace(/_/g, ' '); if (vars) for (const v in vars) s = s.replace('%{' + v + '}', vars[v]); return s; };
  window.addEventListener('message', e => {
    const m = e.data || {};
    if (m.brand && m.brand.theme) document.documentElement.dataset.theme = m.brand.theme;
    if (m.locale) L = m.locale;
    if (m.lang) document.body.classList.toggle('lang-ka', m.lang === 'ka');
    if (m.action === 'show') {
      const p = m.payload || {};
      const left = Number(p.left) || 0, max = Math.max(1, Number(p.charges) || 1), pct = Math.round(left / max * 100);
      $('mine').textContent = p.mine || '';
      $('vein').textContent = t('table.' + p.table);
      $('count').textContent = left + ' / ' + max;
      const fill = $('meter'); fill.style.width = pct + '%'; fill.className = 'lxr-meter-fill' + (pct <= 15 ? ' is-bad' : pct <= 40 ? ' is-warn' : '');
      $('state').textContent = left <= 0 ? t('ui.worked_out') : pct <= 40 ? t('ui.thin') : t('ui.rich');
      card.classList.remove('lxr-hidden');
    }
    if (m.action === 'hide') card.classList.add('lxr-hidden');
  });
  if (window.__LXR_MOCK__) window.postMessage(window.__LXR_MOCK__, '*');
})();
