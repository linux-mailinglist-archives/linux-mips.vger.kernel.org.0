Return-Path: <linux-mips+bounces-15435-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cQJaDSCIRmrnXwsAu9opvQ
	(envelope-from <linux-mips+bounces-15435-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 17:47:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D920E6F9A04
	for <lists+linux-mips@lfdr.de>; Thu, 02 Jul 2026 17:47:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TzKC7lqe;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15435-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15435-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8382F300680F
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jul 2026 15:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D1E331EB6;
	Thu,  2 Jul 2026 15:47:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15810330656;
	Thu,  2 Jul 2026 15:47:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007259; cv=none; b=F4mUX7x/DQXe2GF5L/VM2cuvPhj00NUxtZRepo4DOH34evaTVBbxuopleArePrGVrCTJl4RQp7QIkhBaFAPZWBEaJyHmQ8+zHoJcnF5Rm41syi73b1aQMqeQfLDBDrovlJIAWhHdMdAPQznwlyYj6n9NZ77zTezO6ieM1wPkhXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007259; c=relaxed/simple;
	bh=TvUAgfWNpLkZ1nlsw2EGCWNSAzGkDsQHdYOGjIT+X48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js6/Wxk9YURp1AXb1TdZO5jgSZ2CUcw9+Ntj3cEtVN0qOVvuWsmsDQe0DQr0zk1dY/DtxKrjlv4s2CyQ5un1tAU28LWU/Oyr9vqQ4FXyI3gGH1hZGQX60QVHjeQmGQLYWYz/J/Prm6282sdeCYEPfQzuk5fvz57cIFL3algA8Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzKC7lqe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504D91F00A3E;
	Thu,  2 Jul 2026 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007257;
	bh=Po4UWa+Txwx6nSBMW1aPQiZMcfNfQH1HH88CC93hgvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TzKC7lqe9Irn8JWqPCnRnBZrIjo+wjSEuABLaM62PvcVIf4DaJMLiJvSaLOlIhJOf
	 znTjZNuNsA3irPkrJRqgdqBSalvaquhCKCvJXbcnp48ft4f4usQWudMjc5HdiilEg8
	 aXu2StIvmQVSGOVmy/Z45hqYBBWUQ4dmbbAuXk0zKTG9Nk6i9FrPim4oLQSVwaxjeJ
	 SDNmxdCjFnKqxvBlFG1TSv8opFwMO6hCg3J9TODlwY2GGXnrD8Ppex9n5gZkrvDNyw
	 HAH74jjJFvvUXueVEU77M3F6be8/OSAHgO1cGcNXrmLyLcrgWJzjocoh6IYJOxKTNs
	 hiEtCFwm59HOw==
Date: Thu, 2 Jul 2026 16:47:14 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	l.stach@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com, 
	kyungmin.park@samsung.com, krzk@kernel.org, peter.griffin@linaro.org, 
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, 
	tursulin@ursulin.net, robin.clark@oss.qualcomm.com, lumag@kernel.org, lyude@redhat.com, 
	dakr@kernel.org, tomi.valkeinen@ideasonboard.com, hjc@rock-chips.com, 
	heiko@sntech.de, andy.yan@rock-chips.com, thierry.reding@kernel.org, 
	mperttunen@nvidia.com, jonathanh@nvidia.com, kraxel@redhat.com, 
	dmitry.osipenko@collabora.com, zack.rusin@broadcom.com, matthew.brost@intel.com, 
	thomas.hellstrom@linux.intel.com, oleksandr_andrushchenko@epam.com, deller@gmx.de, bcrl@kvack.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
	david@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, hughd@google.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de, 
	kees@kernel.org, perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, linux-fbdev@vger.kernel.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/13] mm/mlock: convert mlock code to use vma_flags_t
Message-ID: <akaH31jAOuMtthKF@lucifer>
References: <2db16db81538355ca65f778c246d2381c673cad4.1782760670.git.ljs@kernel.org>
 <20260702132107.73727-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702132107.73727-1-lance.yang@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15435-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linux-foundation.org,alpha.franken.de,linux.ibm.com,ellerman.id.au,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,samsung.com,linaro.org,intel.com,ursulin.net,oss.qualcomm.com,redhat.com,ideasonboard.com,rock-chips.com,sntech.de,nvidia.com,collabora.com,broadcom.com,epam.com,gmx.de,kvack.org,zeniv.linux.org.uk,linux.dev,linux.alibaba.com,infradead.org,arm.com,google.com,suse.com,perex.cz,vger.kernel.org,lists.ozlabs.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lance.yang@linux.dev,m:akpm@linux-foundation.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:l.stach@pengutronix.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:zack.rusin@broadcom.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:oleksandr_andrushchenko@epam.com,m:deller@gmx.de,m:bcrl@kvack.org,m:viro@z
 eniv.linux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:hughd@google.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:kees@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:dri-devel@lists.freedesktop.org,m:etnaviv@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-fbdev@vger.kernel.o
 rg,m:linux-aio@kvack.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[82];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:email,lucifer:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D920E6F9A04

On Thu, Jul 02, 2026 at 09:21:07PM +0800, Lance Yang wrote:
>
> On Mon, Jun 29, 2026 at 08:25:34PM +0100, Lorenzo Stoakes wrote:
> >Replace use of the legacy vm_flags_t flags with vma_flags_t values
> >throughout the mlock logic.
> >
> >Additionally update comments to reflect the changes to be consistent.
> >
> >No functional change intended.
> >
> >Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> >---
>
> Nothing scary jumped out at me. Just one tiny nit below ;)
>
> [...]
> >@@ -466,24 +466,23 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
> >  */
> > static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > 	       struct vm_area_struct **prev, unsigned long start,
> >-	       unsigned long end, vm_flags_t newflags)
> >+	       unsigned long end, vma_flags_t *new_vma_flags)
> > {
> >-	vma_flags_t new_vma_flags = legacy_to_vma_flags(newflags);
> > 	const vma_flags_t old_vma_flags = vma->flags;
> > 	struct mm_struct *mm = vma->vm_mm;
> > 	int nr_pages;
> > 	int ret = 0;
> >
> >-	if (vma_flags_same_pair(&old_vma_flags, &new_vma_flags) ||
> >+	if (vma_flags_same_pair(&old_vma_flags, new_vma_flags) ||
> > 	    vma_is_secretmem(vma) || !vma_supports_mlock(vma)) {
> > 		/*
> >-		 * Don't set VM_LOCKED or VM_LOCKONFAULT and don't count.
> >+		 * Don't set VMA_LOCKED_BIT or VM_LOCKONFAULT and don't count.
>
> s/VM_LOCKONFAULT/VMA_LOCKONFAULT_BIT/

Ah yeah oops, will fix and respin! Good spot [and claude missed it ugh] :)

>
> Otherwise LGTM. Feel free to add:
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>
> > 		 * For secretmem, don't allow the memory to be unlocked.
> > 		 */
> > 		goto out;
> > 	}
> >
> >-	vma = vma_modify_flags(vmi, *prev, vma, start, end, &new_vma_flags);
> >+	vma = vma_modify_flags(vmi, *prev, vma, start, end, new_vma_flags);
> > 	if (IS_ERR(vma)) {
> > 		ret = PTR_ERR(vma);
> > 		goto out;
> [...]

Thanks, Lorenzo

