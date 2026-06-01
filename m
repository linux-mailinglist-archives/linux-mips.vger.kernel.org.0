Return-Path: <linux-mips+bounces-14839-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJpTBfFbHWoBZwkAu9opvQ
	(envelope-from <linux-mips+bounces-14839-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:16:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE3F61D2E7
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F1BD3007AFF
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 10:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983343921E6;
	Mon,  1 Jun 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gfbU4dVM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qYqFzf19"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EDF38AC61
	for <linux-mips@vger.kernel.org>; Mon,  1 Jun 2026 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308972; cv=none; b=Y7pPfPcZ1OVCHjl7eKLqw+X+8oFpoRyzUj4ofwg0gN/EtRL8h2yUYEJGcksUo+cwQoK33dxecIkYfYCy6zykZEa46GubPppgQDpkipF9wzCTwOqXy6u041FkOfl/B5Kuprg3+VOdZVm0m2pPu/TRBiBG5Ii2tDdg9pj+jssRee0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308972; c=relaxed/simple;
	bh=//fpv6KtnZGPacElQOdywvJfvUtWfzycEBrOQGiMPzk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WYraR6Sp05TlVT69yWfr/GYYptX76bDNlJk5T9ODuehIr5zZVM/Ki6IyyrYcnF7V2IarNuOlSFJdrtBpxsFhvs99/skChU5z3x3tD5q8om8rwA1xnfY/jTcFEotWtibfU9VeqVliKqyPZQjJmukn1zCAlRoCOHTwxUN4Mb+lWnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gfbU4dVM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qYqFzf19; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780308966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec/J4tNvrAMdwkOq5RTOf80WrT+IRWDMG7cFT7/0gaw=;
	b=gfbU4dVMY/wH4c/7itvNad/Ic1zKdnn38GuaLQZFUumSCV2pFHlOB7Nw6wjEGSW4ZpK9m3
	viIPYyifpvhzOFK+YlWcEkALX4178HepizE86qMu9JxHsE2QSuluj2gK0fB3xaTjgHtyYT
	K3Xm3lmHoa0WYReKDXDXJmQ2Te+0xnE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-s9rytaNhPaOYk97ipg1XHA-1; Mon, 01 Jun 2026 06:16:03 -0400
X-MC-Unique: s9rytaNhPaOYk97ipg1XHA-1
X-Mimecast-MFC-AGG-ID: s9rytaNhPaOYk97ipg1XHA_1780308962
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a763180bso11035995e9.0
        for <linux-mips@vger.kernel.org>; Mon, 01 Jun 2026 03:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780308962; x=1780913762; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec/J4tNvrAMdwkOq5RTOf80WrT+IRWDMG7cFT7/0gaw=;
        b=qYqFzf198t5SPjnGYTxm2tKTCvzMBJI2CCWRPxD/dU3kRMjYnN/ed9VLpQGypAl5Ho
         i4eXAZE4oKfy/iOKRi8EoCjlTsPIDbf5+pOdP20Y5kgylUZBD40govnhIm5EQ6N4NrRa
         Wb7OYlj/DVytwIL5+uMkcU53JMnU4adtZ0FoZdDJUaBdJbrmIVU88xJOFhtNky9FwnXK
         /gvlEUJD4nRuaNkhon5QjDtGDIt0eitUjXr+cL51lm7cO8v0wjNLpwj3Fo6kW3mVzKcs
         +clN1HG6CImY9UL1mRmZsfVXzWrMXt88sCM0SE1UvBMbKKGn66gbqD1R7hVWmCBSRn4t
         Pm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780308962; x=1780913762;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ec/J4tNvrAMdwkOq5RTOf80WrT+IRWDMG7cFT7/0gaw=;
        b=YqJd9bV2pjikteoL0kLJMb8QzqkuKi+kMdzyGhTm1ZTu/iKzZqeHZCtEc44HyVLIjT
         vDTGgiQtRA0fA7eQ0IVom/tbgIKkM4d1cLGd3b2uw2mJtI6MLwSOW+18glwVnzn6ZKZj
         EWr3q5ahusO6kLTipgykcvJgd5rsZ3xgm6Zzgc5G+dRPg0JZ68AKc1IdvScu+QtrTSQX
         K+HF51C5CiVNuBrWWE4ZCwhN/qLOhdwwPR4GFT9BvuQLoi1z+RhO2Phy98ufQSCQrbkR
         Nr2gfpjqMadfYk9JXGsHecEIFrgJkd3QLS4wjqZnAkbvLfgNXTH+Uclr0clAI5HeQXRb
         xo+A==
X-Forwarded-Encrypted: i=1; AFNElJ8hn/geIzFZU8Qj3kGLFl3x76e6syOn31gtOMpU39mQjiwA/WRq9B+lQTLLV0iMToTXOgymWKtHuxyH@vger.kernel.org
X-Gm-Message-State: AOJu0YzSpiCbtFW/OJMhIUVmglG30k3fSIOuqllM2T3n+O1sFi4+N5XZ
	QKJCaFt1qyiQPBTtPG+SpTdo2GzIjwfIzMg/fYkO9/hsEJGKz1leeuy1aPVsGHfkijLDWMwhNbt
	8e2+TjaGfJys4B2Xqy18qphHQ3GShaFDwPWnzDvieCpyjuYsNbS1h1ob5Yztr8yQ=
X-Gm-Gg: Acq92OHdHpdawM47Dg9ZfXW69c3IS9vv9t0lE1+6ZokgglKAC9tsBZhtuZ+B8fLBGf9
	0acjfMJnY9zA1s35ytAjvjO/8BrsEKzdsO/MyKKz6DkYhOwpAKXE2hpusGxLQCscKqd/2a9idEp
	bsc2GrS7tx+JH2j3C8qfDopXMeila9r389LBaoT5Sz7VpvmxHgKbEPUr1kkg+l9nbMLsmqc6KhL
	3cyD17gYNXTA+roLXAWAhD4FwskL7kj44oBZrWa1UF6fy4l2+l5Svs6eaz8L1w1BGSKunh87OEn
	wRZ4LrQ70PRJUY+kFkmat6slZ9Upa1kOERZdUjZe10sROh4bcPUucBqPHLOnPw97pfPDo2NDHdb
	q5SsuBKNU32/l+OhH1gnaHb4nKBWnQo1pBEh3tvhuHu5MrQ6j8R/QmOu1Iz06MRR6jbjytPC/5O
	kSfN12HafPmxzXLJ4=
X-Received: by 2002:a05:600c:1c06:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490a29838b6mr211911645e9.24.1780308962222;
        Mon, 01 Jun 2026 03:16:02 -0700 (PDT)
X-Received: by 2002:a05:600c:1c06:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490a29838b6mr211910935e9.24.1780308961705;
        Mon, 01 Jun 2026 03:16:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm23621879f8f.0.2026.06.01.03.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:16:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklinux@outlook.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH v4 01/10] drm/damage-helper: Do not alter damage clips
 on modeset, but ignore them
In-Reply-To: <20260530185716.65688-2-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-2-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:16:00 +0200
Message-ID: <87y0gylg67.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14839-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,linux.intel.com,redhat.com,gmail.com,ffwll.ch,kodeit.net,proton.me,crapouillou.net,outlook.com,broadcom.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Queue-Id: 2AE3F61D2E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> User space supplies rectangles for damage clipping in a plane property.
> For full mode sets, drivers still require a full plane update. In this
> case, leave the information as-is and set the ignore_damage_clips flag
> instead. The damage iterator will later ignore any damage information.
>
> Also fixes a bug where ignore_damage_clips was not cleared across plane-
> state duplications.
>
> Leaving the damage information as-is might be helpful to drivers that
> benefit from this information even on full modesets (e.g., for cache
> management). It will also help with consolidating the damage-handling
> logic.
>
> Also add a new unit test that evaluates the ignore_damage_clips flag. It
> sets two damage clips plus the flag and tests if the reported damage
> covers the entire framebuffer.
>
> v4:
> - slightly reword the commit description
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.10+
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c     |  1 +
>  drivers/gpu/drm/drm_damage_helper.c           |  6 ++--
>  .../gpu/drm/tests/drm_damage_helper_test.c    | 28 +++++++++++++++++++
>  3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index cc70508d4fdb..84d5231ccac1 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -359,6 +359,7 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>  	state->fence = NULL;
>  	state->commit = NULL;
>  	state->fb_damage_clips = NULL;
> +	state->ignore_damage_clips = false;
>  	state->color_mgmt_changed = false;
>  }

I would split this as a separate patch since is the bug you are fixing for
commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to
ignore damage clips").

>  EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
> diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> index 74a7f4252ecf..945fac8dc27b 100644
> --- a/drivers/gpu/drm/drm_damage_helper.c
> +++ b/drivers/gpu/drm/drm_damage_helper.c
> @@ -78,10 +78,8 @@ void drm_atomic_helper_check_plane_damage(struct drm_atomic_commit *state,
>  		if (WARN_ON(!crtc_state))
>  			return;
>  
> -		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -			drm_property_blob_put(plane_state->fb_damage_clips);
> -			plane_state->fb_damage_clips = NULL;
> -		}
> +		if (drm_atomic_crtc_needs_modeset(crtc_state))
> +			plane_state->ignore_damage_clips = true;
>  	}
>  }

This makes sense to me as well and I agree that re-using the flag for this
is better than making plane_state->fb_damage_clips == NULL the condition.

As mentioned though, I would make it a separate patch. Both changes look
good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


