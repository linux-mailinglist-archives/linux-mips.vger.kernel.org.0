Return-Path: <linux-mips+bounces-14841-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fQLIOVtiHWoHaAkAu9opvQ
	(envelope-from <linux-mips+bounces-14841-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:43:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3461DC4A
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90496307A0F9
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 10:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8B13955E2;
	Mon,  1 Jun 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h14RMu/y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tgeWTFco"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78762391850
	for <linux-mips@vger.kernel.org>; Mon,  1 Jun 2026 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309265; cv=none; b=oF340dwzIBZ9xWCYnDZOGmx5BaQEEOOVw5O/BcECMDCndqCPABdSf8rFkWE3tMZQZ9oWWTRTYvukdU6Fr47LZaZl9A9MQrCUk/0rSI5HSZ40Tv/EC80UWMjkMxsX6W1nJ3jM7IFaH5ezweOvY2es8Lf6hCCJg26sKTmxRl9Htu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309265; c=relaxed/simple;
	bh=326g4EpO+TBbZXT0k/fdB+P1jFfmFRBJEf+jFr0a2Gg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YNXbSCcJPDnEY0BXmvzM+d9ZAOX7te0mZbs/qy2kj7vg5Qa2ky1lYvuKRn01Atm+CCaR71mp7w92Rn4wfpIJL9sM38p5qpzTnEm5BoOGM16wYdGpBtx6YhwZZXM751Xp7E2TEKwuKoaoIhqH932Nu0T9H+s/9hfdEhp8YV5GqiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h14RMu/y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tgeWTFco; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780309261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PtraVy72eIuUfdejQSU7WTEFINXM3tMuzrGKzIN4pEs=;
	b=h14RMu/yjv2gPdqpZr8vIoS715XR2o8uXdC9OZ5yXtm/EH5vhgqD9EF5PL/IGimn2Hx0Y7
	xNwzUXQY7o700I0A4oJZg1KTd2adWoMeR5Mj4MxSRVmK4bpE19xobbDwOLoNALUA0C3i0X
	Y0S5KStyDx3yhJe+82SZgFtCucpiurs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-kF8_61zxNgSzLF-g0eYqYQ-1; Mon, 01 Jun 2026 06:21:00 -0400
X-MC-Unique: kF8_61zxNgSzLF-g0eYqYQ-1
X-Mimecast-MFC-AGG-ID: kF8_61zxNgSzLF-g0eYqYQ_1780309259
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490a786f987so12220295e9.3
        for <linux-mips@vger.kernel.org>; Mon, 01 Jun 2026 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780309259; x=1780914059; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtraVy72eIuUfdejQSU7WTEFINXM3tMuzrGKzIN4pEs=;
        b=tgeWTFcoJfOaw9rArHyK8x0OA4JG7d1VaOfuzQN+5tYYRk5qOTvyIWTVFKAgfNx674
         7Y0drA0hJu/nmsGTkLGF3XUrOH7oL3Dr6r9OgB5CC1CzFidip0FbJ0+jKOaJ8wdox2TN
         7X1Ikwb0s5YY41TnWHgIUWvDFGO9P38h1i1q7nJKfxQDVns7bxDVINuztj6aS4luS1FQ
         //aV8AJDldy4/Sb7eYs2sNSCTZg8txR41Ilo4E2JQwadGsr87+cD+VZRNELe3LvTbsR7
         nBfyrQlHR7RHbjAjp/9A5iESpKdivzSQZ9mVSykZsa6lH3IAdWGQtUEqHAbGQHrArOf5
         XZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309259; x=1780914059;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtraVy72eIuUfdejQSU7WTEFINXM3tMuzrGKzIN4pEs=;
        b=MnF4/X8UZRkFobOUqKdgIfsxPa8jexBgWpxQdBKIH9efisJ8UdgI4jiaVdqqalhndo
         AYemS1SXGdHDAZpHiTwRDGA7IeBPAUf4bBj9+84TIIrK/TEivx1ZcHjJlYNHhgKIAcFJ
         zkpb15EBI65GndiQs8sAvFk5tI4W/WzyeJD7u8OAOjEgIF+YYR2QDCbmBdMEFmh7grRG
         C1IxRZQ+pQOtkzTflCnvr4scyIKYyCEKOanTI2pEPMgFovGgq5Gn9yUjUs56kTCOArxc
         A1OQJxwIgle3QhPzurFNKH1d90GXtubm261Yvzrf1DEHlhjryBFoWhHFJWs7bxc3bxWM
         Uvog==
X-Forwarded-Encrypted: i=1; AFNElJ/OGkaOiyYqY2Nu+SnzxlKzP16TtgK+ve/A+Wzr9Chl4/cKaj95qGZHrS72cysuBOIuf2sbeO7Mj/YV@vger.kernel.org
X-Gm-Message-State: AOJu0YyC59zkZpy7epCtuELyvm0xtOL4D6wyu3FnQmX3cuSEwxfeSzf+
	CwZCc7NkIp6S5bcjssWf7a/SYkg/HdnTnmI/bnYmabyJHomQz8xDB+f4SyQrKJpbz9Ee/7M+T1V
	Do1s+XdA6tmkDQ+R/lBJ1Em3P0jUX1PIyHNAykdKIQZ0YuH7DuY/p2RQWh/WPAxc=
X-Gm-Gg: Acq92OHfPC3j8ruGkfDyM4iLl2GwZsWq5w8uzK42zVeRmFU+0TdP25kXnUovHPr6TR8
	l6rDgAyJYq9AsZvAIYnRS688/Oe89CqGC4iWr1VQyahKRJz3GA9pllWZ3seoADE8wu0QkG57jTP
	AbhPtCeO0pHPqBZPHIPGznKlHce/jnkQxhIxGkQTuWkcgKq/yicay412BzGRIA767cItR4a+4gR
	L9TQ6Z9Gag4kztUhOOxPtOUFTuFSPRLPB+5OpWoRd0wxT1qmzptRPUJMvLxnyhN92L85OaP9ISQ
	dwBuYuySTBbNDHTPOv81/azxiYn7xQNS/WCDcYpJrBpasJm81Lh2k2jG0zR2ADgLqMrRzvcq5hg
	ROxunTkjYYHkD7ssre9NPXRrnIntZz7pGsFPZCFQTvRdQYbLeRbaXoyDXBYR3cmMPffE/r0VApz
	dsFpLN+f60RG73dFM=
X-Received: by 2002:a05:600c:1992:b0:490:adb6:793d with SMTP id 5b1f17b1804b1-490adb67fc0mr29782695e9.26.1780309258845;
        Mon, 01 Jun 2026 03:20:58 -0700 (PDT)
X-Received: by 2002:a05:600c:1992:b0:490:adb6:793d with SMTP id 5b1f17b1804b1-490adb67fc0mr29781855e9.26.1780309258391;
        Mon, 01 Jun 2026 03:20:58 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490aeacecfasm19237985e9.4.2026.06.01.03.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:20:57 -0700 (PDT)
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
Subject: Re: [PATCH v4 03/10] drm/ingenic: Remove calls to
 drm_atomic_helper_check_plane_damage()
In-Reply-To: <20260530185716.65688-4-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-4-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:20:56 +0200
Message-ID: <87se76lfxz.fsf@ocarina.mail-host-address-is-not-set>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14841-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,linux.intel.com,redhat.com,gmail.com,ffwll.ch,kodeit.net,proton.me,crapouillou.net,outlook.com,broadcom.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ocarina.mail-host-address-is-not-set:mid,suse.de:email,broadcom.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C3F3461DC4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Atomic helpers call drm_atomic_helper_check_plane_damage() after the
> atomic_check anyway. See atomic_helper_check_planes(). Remove the calls
> from the planes' atomic_check.
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


