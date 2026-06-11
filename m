Return-Path: <linux-mips+bounces-15051-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ba2CGS2KKmogsAMAu9opvQ
	(envelope-from <linux-mips+bounces-15051-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 12:13:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 00764670BEA
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 12:13:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=W5P8aYKS;
	dkim=pass header.d=redhat.com header.s=google header.b=MXxR86fN;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15051-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15051-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B18A300B452
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 10:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198383C988D;
	Thu, 11 Jun 2026 10:13:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B717D23EA94
	for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 10:12:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172780; cv=none; b=NQvbz7/1Ii5+8LfCqp5PUzd2hCWiDec19m4xgKvMZ4uEReD+360OMyF/IGQjdYFFODRAnj2eYV6C9HrCGVVu29xMICE+aY0euOjkQR7ARDK1xEw7fbbo7RCrzcCmyKuQI44//gPdH/+mhd7eJ/h5cgUX9s/w8KXeTBR2q/dyHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172780; c=relaxed/simple;
	bh=JQ5T8Ove8mxcipFoyWUXvQY6lHTB2vT/asE++CDukY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ThMQRVZ/zJdVO+QYADDTKtHh3sZTp70z5RFjX2esDbb4SEfN/VA5PLvHsa8eCbTbE2D96h5eyyAbhdJa/K42l4ue3cZpD0K5mbggkAT/8UR87Gn+gTwi2WaN3/Rc0rQNvItXknIgV5E1/l8bqusC/9NYMFum/9hwq7fNxPGjbyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W5P8aYKS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MXxR86fN; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781172777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dFYGrtWClhfZ3Q43+mH8yJXNZwovzAkM0JScXulojb8=;
	b=W5P8aYKSblK3mjJytCe0Ph6MGhk/zYy591McbqpHdtgc5kRUjVo6Uibuz314zqoR8ND4AG
	QZ1jdRPlTX1qhVOO9F9cdF8bZ5grbi+hAWRyio/5e2OaC1xV11HkTD+5kOQc+/i2izSCKz
	Lv5uu5PjTZJCM4Xe1rB06/6F5cvl1TA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-_xFp7_WsN1SqE-8NkuaSQw-1; Thu, 11 Jun 2026 06:12:56 -0400
X-MC-Unique: _xFp7_WsN1SqE-8NkuaSQw-1
X-Mimecast-MFC-AGG-ID: _xFp7_WsN1SqE-8NkuaSQw_1781172775
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490dad70f95so22723375e9.3
        for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 03:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781172775; x=1781777575; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dFYGrtWClhfZ3Q43+mH8yJXNZwovzAkM0JScXulojb8=;
        b=MXxR86fNpMK2OJliQ1xWyAYroB+y4pje2MzQ2LzDglJfeX9+gsikXoQmeyrFdzpRsb
         YEE/VR4MBldAruYqG+EdchGJ727Kfox2A+AgqT6XpMDo1hG+uQaL+6DUMOEAox3jv/Nn
         vHd5Dp72LumCHe6v7UHqD8WhymbA68gHwyYYBEbNyzeo23AAUIYxYDSZixmkjEXxkhhk
         JeCDMrvLi8p6+bAKDs+X3/upH7KmN7phxBGQydi/Rm9kTMiMZbe47aEfvg+f7sVSp7Ch
         cQaQBKOSKT8gHifd2WR0gd7BHj8a22rlxPHo5fFoKS0MONDKI2+RVyxLfDaRxyrvDjs8
         cqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172775; x=1781777575;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFYGrtWClhfZ3Q43+mH8yJXNZwovzAkM0JScXulojb8=;
        b=QAF2mZl28RcC1lrYVk80VPxOEW3n1IoTKGQt1boEjd1O7cVqUZaR3xxrheoiSqnJEK
         L/2GgfkazteRmLe57Zz+Tqz2alcKFAD59px1f5cUCkH+1EfuO9pHtpTPR06rPMgi5Dhh
         pe0hpcdctXoJB8LXGR/ZAdXgdDrEhifJm7pkrsxNJ2u5c/tCvWsqRKJvzjosJVEpuPoh
         VIK/Wxtmkn9TxceyxpteLWp7CdWu81IBoX3QLKboQQUrLW9+OhysBC3H4N5GV9DH0owV
         gBRC4x3zQYjB40XrO6ybkns9GV61Vm6BpM/S9v41afT68RXv3+GiBmORAGSjY+QPDrKt
         kSiA==
X-Forwarded-Encrypted: i=1; AFNElJ+2zp6dbzdh6mpjP2czanf8idpSEa3gZ+fi1zXb00TBH5MOX1cLk8pNHburaIZL9XLRrNokgxeLcnu3@vger.kernel.org
X-Gm-Message-State: AOJu0YzIq9WPhsboizo9T68sMhejGrqO39TcDfnNGCOApN4UdCYvePdI
	8FlIaf1cUBOBJewr574S5yl9qC9VUKNlzVj5yyDlEcQCcwjCcaK+X7SJlU61v8a5NGqIO0p7Xdx
	Ckvt3133bI8xU6Ez92pePeCdQcRic+pt14OGU9bTpUVoXZ1L1IWTKiXjN2GNjX/U=
X-Gm-Gg: Acq92OHLNCISkusGtEzds5mf6SNUGKFhT3q14IyHlWbpBwsaICjqrLdOAZdhffawSwC
	b6Ht65YAIR5PHUN+4XJMldfsKvnI1PqLMTYAgFEJT76CRaudyDW5nvmWsWbcMfqqCcMFlIUwL9S
	6IMkQm7cM/LWHaJKlAYY5YrUyXiSauraJ8hkY62oNTx+QyIIsjIbI+/Bw7J8o2koYdLa4bSrJmN
	lhdVA7aQOQvEgXlvTMK4YAQCJJM9O2CGHUowfPNRWz2vPyThTSk7SBl7CGfJFnS94lm7enodJzh
	3WCH3GuMpnIRy6aH6XFEdIjyT/nHLjn54pvFkjqK3chsh+V+zkFuDs4JhaYKEP96NF5/XqupieH
	fS1lvnI8AfcpR18l6OHTB+RJdCk/G/091OTlFmEDQ0oZ8gr+SFkOLYUUHQhWyyfzGvaX7I29QbZ
	kc70yGEoprrJJ6N0c=
X-Received: by 2002:a05:600c:c493:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490e5639bf0mr26218415e9.24.1781172775364;
        Thu, 11 Jun 2026 03:12:55 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490e5639bf0mr26217975e9.24.1781172775016;
        Thu, 11 Jun 2026 03:12:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e532c778sm38051805e9.14.2026.06.11.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:12:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklkml@zohomail.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zackr@vmware.com>, stable@vger.kernel.org
Subject: Re: [PATCH v5 04/15] drm/vmwgfx: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <20260610152505.260172-5-tzimmermann@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-5-tzimmermann@suse.de>
Date: Thu, 11 Jun 2026 12:12:53 +0200
Message-ID: <87pl1x5qsa.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15051-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[javierm@redhat.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:airlied@redhat.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:admin@kodeit.net,m:gargaditya08@proton.me,m:paul@crapouillou.net,m:jani.nikula@linux.intel.com,m:mhklkml@zohomail.com,m:zack.rusin@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-hyperv@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:virtualization@lists.linux.dev,m:amd-gfx@lists.freedesktop.org,m:zackr@vmware.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,linux.intel.com,redhat.com,gmail.com,ffwll.ch,kodeit.net,proton.me,crapouillou.net,zohomail.com,broadcom.com,amd.com,igalia.com,intel.com,ursulin.net,collabora.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ocarina.mail-host-address-is-not-set:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,suse.de:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00764670BEA

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The mode-setting pipeline can disabled damage clippings for a commit
> by setting ignore_damage_clips in struct drm_plane_state. The commit
> will then do a full display update.
>
> Test the flag in the primary ldu plane's atomic_update and do a full
> update if it has been set.
>
> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
> to ignore damage clips") introduced ignore_damage_clips to selectively
> ignore damage clipping in certain framebuffer changes. Vmwgfx does not
> do that, but DRM's damage iterator will soon rely on the flag. Therefore
> supporting it here as well make sense for consistency.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


