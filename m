Return-Path: <linux-mips+bounces-14844-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELd6O/dfHWojZwkAu9opvQ
	(envelope-from <linux-mips+bounces-14844-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:33:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87961D891
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B348130508A8
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 10:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D8739C645;
	Mon,  1 Jun 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bkvFyqP6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewcwaDyN"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D639BFF5
	for <linux-mips@vger.kernel.org>; Mon,  1 Jun 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309672; cv=none; b=XXnCfvyNjBEF6BD1felpQsEFMfy4Z1PLh865HncbneQk3lWGRcPNqTSSQ0iNzWZZa5D7Cyxau3D2iUkqZwmceIVm/fNWBgBFhnJtLVyP8HXpbqkpMU/04YPuAAr+S7LBq+f7a06GsCQpRTm8pa3nTX9J+uKYkyv2/sEY/imZ87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309672; c=relaxed/simple;
	bh=SAgXIx89304YyTe8+6UMLZsSBSUvLSpMqzKtolzE27s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BKvMLFiDtdI9cE9BL+djd02jriOUX1uZY998JtpnfstY7evRcRP1TqzQpXh2sc1XzAab6OkUFzadBCQx9Sl1yD0oQJcuCS4iTAPt7HoIfnAui+u49+keTVdzxiQYinubeHc3AMH6Jk2PUTahCM5Tv1OnkInpgv4ZNS51SHE/Nqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bkvFyqP6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ewcwaDyN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780309669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hD1h4dJE66yskCwSbjuaF026xxijLvV5fH5oqPl0EUY=;
	b=bkvFyqP64A7n9sXJfArZ7i8OGrLfKXxra9KhXKMyfpmWJ7xxVn5sTqFRrpye7PI9IeKvpm
	0VmnIhtndI/P35aPmJXQMKCohP0M1fdwhHP3TZA015VWaVMHy1JUAM9ssoWIbhZlZyPuVd
	DQ8lw9fAaga3E6dgu1bey4L7XuzyI2E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-mPljAVmZON-hlnUO8YiCVg-1; Mon, 01 Jun 2026 06:27:48 -0400
X-MC-Unique: mPljAVmZON-hlnUO8YiCVg-1
X-Mimecast-MFC-AGG-ID: mPljAVmZON-hlnUO8YiCVg_1780309667
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4600cf05f07so944323f8f.2
        for <linux-mips@vger.kernel.org>; Mon, 01 Jun 2026 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780309667; x=1780914467; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hD1h4dJE66yskCwSbjuaF026xxijLvV5fH5oqPl0EUY=;
        b=ewcwaDyNPq7+CD7eIO2nvwQiAedlQUiqFevgJTn6tqqaWKienHc05ZMTF2MIsFckSL
         /Z/DrRgo6X3dW//cgKAImBv26Fg7j7FAemdU6EVTmtGPafJkHxwn4M2bFhO68QXFvjuL
         c0j2690B3zzEDQVO3IU9RyIMVwR0uy9JBGA2wlFXQKMHxJRS6sMKLchoj4xhgnGCtoVs
         uYcgLbc8qsonWqKlpCW5JL+Dk36oNQsJj9UjAaHWQEPyC7nkGjNLp3SXf/z36pefdqIy
         i8fWM+sEwWLBmv1g1mNwdGWxkzGO7+I/cwAoXMApRwSCSmotBdJfZ1OprA+Fi8RyvsVO
         CpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309667; x=1780914467;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hD1h4dJE66yskCwSbjuaF026xxijLvV5fH5oqPl0EUY=;
        b=EjL07fFc9xDQgcrs8Igd0nr0jSLmzlJ0Z8SbCAISDQVq2vDv+PQAUl5aPOxHMYFARI
         tXmUEQNjhCa9Xl8dB73AD4kJQodN889fuZwnqvdq7eSeqN5vJMBl2fxnJItY4XrKw+do
         6Jj2Pk77Vlym1dnmlOAG+t68balmKsp6Cg/njS1NSvto9hAH7MVpSFak7Z2Y3HwRyCHr
         Xa0kbaEovqhQ/4xZYT4Ulpi00/gZSPnb7gwjbejlEZze0JQsHWUnmcypU6JgvXubmWoQ
         1DinSZQVUT9nNAewk2x9Tcd024CglanfI4VvYZrmiQIUMi9SWsmHe7E/ipR4RMWVipck
         H4VA==
X-Forwarded-Encrypted: i=1; AFNElJ9z2v4r3/NmZEqlFCxt1gN4Ny/Dho43AQG/gU7c0lxuqAOJ/Yx5csfsqNb4vB6cU9/NQKNCAiHj0FUN@vger.kernel.org
X-Gm-Message-State: AOJu0YyBbrcKrKx1FRT4qWO9rT3KMM7PSIc61JEJY6lMg37rly/wz0VR
	oNnX6z/uY0jYqPiKpgA+pYERU59/OZgQT5K5EitUq9kt+Kog4Qmnut8l8w5GtefzrqteOhGBnj1
	boCXC13fNuxrW40VYT8URI4cdmCiy416mTvXtlQw2VfYKU381HXqfNY92fYQmS5U=
X-Gm-Gg: Acq92OEAaCkOlzZ6gD1sUaDd05TVXbdCgDUjtlmq8dNQesOTObnla0dNMp2qCmb+8H1
	XucGypS/m6FEHnmcPUMo/7FlMBwmFFq/d5Z0rXamJ9nl41EP+t1H/xCam7dM1J+/nLIVP7j3n6j
	36fXyEFIiRQYKPHZVRgS2Zu1B4wGPwWstkpmayj7mGTFs7B68GgwkyG2nRacBI8S5AqCRndKu41
	byUsJ6ny9cIRLcpmodXIV8Vwch9sm4FBGIs70zMGWZnPduTw2cAwmC0YFXEBtB+ZvIJ01sQEeeV
	l9wYWzknX8YV4N6Prp5CHCVIYUtMPNBAR0xQUd9EsIvrXDdXE+kQe+IknGbGQ5f1oa2I5RJD3V+
	EdFRC9kF56PrTPXK5DtIn8gvbUkWc/d4d4ramu2Qed6azUtu6ZKdxHp6byFvMYk3TQOhKcpnEGB
	RZIn1zpHG//JJmZSA=
X-Received: by 2002:a05:600c:a111:b0:490:469c:556b with SMTP id 5b1f17b1804b1-490a2933355mr153783255e9.12.1780309666751;
        Mon, 01 Jun 2026 03:27:46 -0700 (PDT)
X-Received: by 2002:a05:600c:a111:b0:490:469c:556b with SMTP id 5b1f17b1804b1-490a2933355mr153782735e9.12.1780309666314;
        Mon, 01 Jun 2026 03:27:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm23690022f8f.0.2026.06.01.03.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:27:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklinux@outlook.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 06/10] drm/damage-helper: Test src coord in
 drm_atomic_helper_check_plane_damage()
In-Reply-To: <20260530185716.65688-7-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-7-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:27:44 +0200
Message-ID: <87jysilfmn.fsf@ocarina.mail-host-address-is-not-set>
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
	TAGGED_FROM(0.00)[bounces-14844-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ocarina.mail-host-address-is-not-set:mid,suse.de:email,broadcom.com:email]
X-Rspamd-Queue-Id: EB87961D891
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Planes require a full update if the source coordinates change across
> atomic commits. Evaluate this during the atomic-check and set the flag
> ignore_damage_clips in the plane state, if so. Remove the check from
> drm_atomic_helper_damage_iter_init().
>
> This will help with removing the old state from the atomic-commit phase
> and simplify atomic_update helpers a bit.
>
> Several unit tests check against the change of the src coordinate. Drop
> them as they do no longer serve a purpose. If the src coordinate changes
> across commits, atomic helpers will set the plane state's
> ignore_damage_clips flag, for which a separate unit test exists.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


