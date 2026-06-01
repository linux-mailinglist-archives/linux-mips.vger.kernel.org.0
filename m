Return-Path: <linux-mips+bounces-14843-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEFxA6JhHWojZwkAu9opvQ
	(envelope-from <linux-mips+bounces-14843-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:40:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A161DB24
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BC7230BEE59
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DE5399CE9;
	Mon,  1 Jun 2026 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHA1kqDv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="slX06cMp"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F561395D99
	for <linux-mips@vger.kernel.org>; Mon,  1 Jun 2026 10:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309353; cv=none; b=uJgLTMFOUBXGZC7mSqCyRRVFK7kxoe1EW4U0O1aXz3D5eGY6d8RGg+H0AN6PP4SxVbCcRZr+1VquG3MxRA648XkKmZiakpLNla23Io6Nh2bd2Y9l2kO5UcAUBgXZHmQCOGPt3TrjjXppR+mQlbiqQQ8eUhgUq3qaJpE38QXglVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309353; c=relaxed/simple;
	bh=NRFqPa3kJwcSLBJ2wEeOqlBygR75BmmbNgByz+aBuPw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lmRjrjvGmQA5HJojjgKpJhtPUcsBhad7zfmD8DPd7oaGZTodgqVveH9LjXE6FIX0dKh37LPSPNuOov/ZEI6alhgqL/9lGzCbCmZeyALQEv85A6fvHpBoxL3A+eqc+fwVjwvG2bp4Gwh0qzQ2IDom7bMqfuQaU/BDyMBeqjzCI80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHA1kqDv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=slX06cMp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780309349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYSWdrjn4aqQxQd0Cf2jKHSTVgv+zTIrZalUlPmgVOc=;
	b=JHA1kqDvAphyub391mJ3rxaYpdSzwIn+04KfRcyzlWz5wXXW6pSNMJ4vj83E3uTatCvXA2
	Ww05f0Jbw3q0ZPoYox1Ts3E90NKI0VoEdpeNTaEHhXFLcZ0ECYI2hzlBn6cMT1HdmwDI/x
	qt38PHDCTYIy+83yiiimchMw7E12pps=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-PElcYxRHOIOarnyf8jUK-g-1; Mon, 01 Jun 2026 06:22:27 -0400
X-MC-Unique: PElcYxRHOIOarnyf8jUK-g-1
X-Mimecast-MFC-AGG-ID: PElcYxRHOIOarnyf8jUK-g_1780309347
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490a060eb84so17862555e9.0
        for <linux-mips@vger.kernel.org>; Mon, 01 Jun 2026 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780309346; x=1780914146; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYSWdrjn4aqQxQd0Cf2jKHSTVgv+zTIrZalUlPmgVOc=;
        b=slX06cMpX3rn7dIHbKp+WJpsLM/GvMcqyuu2iaaewSobKE/b4lMVS2Ux4ntdq/HNne
         EEJK6whY0Bhhm7Gju30TSWclZLU9DTzY/73y/KlqwoaOk5Tm39FCPsQHCgnlEtycvpfn
         NtK+f3tOIJRoFunZgLdkejRcQlWPOxmbVlLgzrC7fjD4dUFO/ReO+NTo+COQKMfctqOQ
         DSLzmh658KX263pVUCPOBsZWqlDMMsrJyeZiD3b54fGTsm9MaECE44iRFZdjisGwdTeZ
         Xsl6iqI5lCTMH0a49T9xi98LqcPfPAJ01RBxSyyZu9ZtClqIRnPY9L+vxx4H+/NcYj1h
         f0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309346; x=1780914146;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYSWdrjn4aqQxQd0Cf2jKHSTVgv+zTIrZalUlPmgVOc=;
        b=qgTNBdQup9L1NlgtEloqVTeP9NtOeylcA/EGExYsRLME/7gxgJ0wLQtaocSMzmR4vp
         PgejF0dw0Sg8vAH58hGf7QZWhS17kbG6Mu1z+Vm2+8gwo1pYfm9r30yC3CZ2/KyQE25N
         6qxHIB8uCE5U4DIRUOR09HoLgcL7xpRMntCORzwy4Aoh6G8zj1lvMr3FbVhfeahYA0Ex
         V0CBVcN19M4A+2Jo/mC1W7t4qBj6bEl5EbXHma9IsAnpqqiV/xn5YPTxhOYXLWqpKOR3
         Hz2xF9zNznbadlmezlSzJiUnV0MfV1fmDgtJKQFk2Sk6A6akqextwZibHY6FTxBnsHUb
         vJZg==
X-Forwarded-Encrypted: i=1; AFNElJ9eJRc66MljYsraVLXtXJwBZMxNI1XGiOKMEhsilfcTT3/54KywbaDicNbqnqdYLW2XkE98ZzpRKpKF@vger.kernel.org
X-Gm-Message-State: AOJu0YyqF9yEXZ76OwoIl7GBr/aBMyiORnan4eNBsBScLWtJ/mPSO0El
	EUsWzeXK/zoPbyai3ZLYasj/FwzC71fdDYuoFf/zCwDibHD1WztUCMmejP5EB3fGpykL3+tA2Xk
	NZw6TvzZIIywIqcPQ0kiG2YGfHuuxnu2Zf9YFgIZXOkzddXivZFymUv5mNkkx2b4=
X-Gm-Gg: Acq92OH0e1BrO2S2i41DsT1pcHWrCW8qau98H48DVgOHXbFlcMrbUIDm7aHSJA0v6fK
	CNiAtV7tjFqkh0MtQWezeRVe0z49NV8EHknMsXdrcUrnbTfT23bZmfIEDBo7iPRNX41vmdA1/GF
	npDbZ2nT/s414Pehge6d+1aIQAKBLD+lZ9Hs9/vnx/RIanGlK6900XJCIJCNyVuQlTrLM/w8tKt
	zwv2AcsEQbZpLjN8cSSZStdPEuzXYqXbSN9PehRoBYzgWqEX+z62Tp2YwuIUbWk/ECzf4wsYqTD
	7YJU0Rz6d4sOoa33YNNDxgA/6SBn5vdFWC6dmInWzfKJj00V/K45qhB6B8W+qC3ga1ByY8ow60e
	U9524uWKRYywrhr0jPbjKz2Wa+FPOjrlPSp8vWE4d1901HACit4VHgBkFWxoKNG6EQte3QmYG8q
	Y8Ui0/cPrSt2QY5ow=
X-Received: by 2002:a05:600d:848c:10b0:490:a1a9:4ffe with SMTP id 5b1f17b1804b1-490a291197bmr137427735e9.12.1780309346504;
        Mon, 01 Jun 2026 03:22:26 -0700 (PDT)
X-Received: by 2002:a05:600d:848c:10b0:490:a1a9:4ffe with SMTP id 5b1f17b1804b1-490a291197bmr137427265e9.12.1780309346037;
        Mon, 01 Jun 2026 03:22:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490aaebf4f1sm74962075e9.12.2026.06.01.03.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:22:25 -0700 (PDT)
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
Subject: Re: [PATCH v4 05/10] drm/atomic_helper: Do not evaluate plane
 damage before atomic_check
In-Reply-To: <20260530185716.65688-6-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-6-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:22:24 +0200
Message-ID: <87mrxelfvj.fsf@ocarina.mail-host-address-is-not-set>
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
	TAGGED_FROM(0.00)[bounces-14843-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 815A161DB24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove the call to drm_atomic_helper_check_plane_damage() from before
> calling the atomic_check helpers. The call has no longer any purpose,
> as the actual evaluation happens after running atomic_check.
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


