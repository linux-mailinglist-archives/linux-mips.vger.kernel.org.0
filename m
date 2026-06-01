Return-Path: <linux-mips+bounces-14845-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FFvFXtfHWojZwkAu9opvQ
	(envelope-from <linux-mips+bounces-14845-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:31:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F111E61D763
	for <lists+linux-mips@lfdr.de>; Mon, 01 Jun 2026 12:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39FDC3008982
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 10:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAE83932C0;
	Mon,  1 Jun 2026 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1CDticZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZUPt0t/r"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1329B392C32
	for <linux-mips@vger.kernel.org>; Mon,  1 Jun 2026 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309743; cv=none; b=uA9GtmvecXvIOqUTa5I5hnq2OLp3O1w9Wg0DASatUjKbtqK6Ov783CMnjg6yedrdl3Z2EvWdUzwZkLBbhkNwHUD/zR9mLfdl2kfR+ARXq7K6FgxpxpZHIcedBfmi1wdb1+bs6XpX+3TChymBxGYLH/9+C3feE86nUKQaYP5neHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309743; c=relaxed/simple;
	bh=fWhbb8RP2B9GFzJgG02F16ZQKziy0+yRxPE3hHDevpk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JnQDGuGq177UkCVxYzC9Auds5RsLrqdRPbBp6sfYSLdRF0pm6gNRby/gmTINeCS2ijccSiPOX3bIwk9FR7cGBbOK/L2mznpYRSuoxidYRXjPPAdK2cC5lVv1BuK0ALBAI12MC2VgKxt4egdCWp+k9OWX1Mnvmay3AqsVQ0HEuII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1CDticZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZUPt0t/r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780309741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR3vdJBAgyYpZ/mB0zSfLOFP8KAbUlqalAgRbWXUhZ4=;
	b=X1CDticZ+CJXYMssi4qhtx3o0Bv2W0WJYZy40DWc73E7EQizIBpr26BgiONy8Gq31xgLWL
	4XrLON6SGtBYwLT77hPAx8PnyV/5GEcTwzpeg4mR0i5tn3pr5zHQbJOEsmAmwhBsKBEpWI
	hqZxqpWwkmV8UNdrDPi9iikVKJyVwkI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-rKeS-HZrNZWTvjtmslGazw-1; Mon, 01 Jun 2026 06:28:59 -0400
X-MC-Unique: rKeS-HZrNZWTvjtmslGazw-1
X-Mimecast-MFC-AGG-ID: rKeS-HZrNZWTvjtmslGazw_1780309739
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45eecec7667so2377600f8f.3
        for <linux-mips@vger.kernel.org>; Mon, 01 Jun 2026 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780309738; x=1780914538; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rR3vdJBAgyYpZ/mB0zSfLOFP8KAbUlqalAgRbWXUhZ4=;
        b=ZUPt0t/r9bJ4kSWsvYpVlvsKMkAniozNbGeQORgSPfBkQfbSuBv1cPHoU4zy9Ps5SK
         VJhBqxghNoFnGOMXokawPNwl88QaQokVJ+k6v9g/MHrGpcz0K7+elWH3eWbbY3ESARSB
         gTekgth72S1oXw++VHeOup5cMOEMtcup6WWC/aMFGvQosbtsWbvIqpaixwIqHhy9tzBT
         LzsQe0sgkJUnRYC85WHL5P+HAeUm2hn6La7o8MD4Gd67or+wllpdCfm2P0ZL0glDSSKI
         o189yHOS2FPaNs0gTj2tlOV4UZodz8WjK1uczhUJI4IRjL2FKA4i4t1IPcpOGEsq/gQZ
         PsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309738; x=1780914538;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rR3vdJBAgyYpZ/mB0zSfLOFP8KAbUlqalAgRbWXUhZ4=;
        b=ejtFYwG0S0WgXcSTCsV5RXDpQ2j4OP3uEe10tYbZdP9ma+laVxN/IdY2ezlx399En1
         A8a4EZx3sj76mILkH2xGRz6hTbeKIJraENfXXrDeisUAKr0N0gx0mwyox0pEANszNGqI
         E5+sH/U8Dd6ONrOYVnMrZyRAbAv39w4p/hg+Uov0+siQJt2KFy9s7/39tJv9PkvCTi3Z
         ULuua0Oa44yiEokETSOh4ePWnyzs6CSvrwJ2qQnE0+z+EXzBgTHNQkW8p7pzAoIUIiTU
         Vytv9d0yXxbOkUN7/5oBPVSnq8My3KSMPc/+/HmImKA4HPcumcncwWf2UjAsKOkI7E6L
         T56A==
X-Forwarded-Encrypted: i=1; AFNElJ+4g1wcH5dwBl9/hETt28TAPFrfN4xIEzIwlOie43bQ9IrPN4akX/r6FFRqQDMpZtUP8/qRf7sRAYjc@vger.kernel.org
X-Gm-Message-State: AOJu0YwDKHZmv/WnWvXlWStrDK1wQjd63P0SZZjX2ziaLiWX4MHox/Ho
	L6KO3Tny6t2tV95Y+ctY+ojKIXQdA3JqseJYhUO6Sj+4dqvVn8NNS5kY+lGQtrx1cYHw652iscn
	03i6EyhxegH43Fm9KqtoHQIfF3j98KV5kG9tvcLCmfg4On0CIJV+W/3VUfkYvN4HmzP1sth0=
X-Gm-Gg: Acq92OHxgCO0VCWfSg8u27wedyh+f5w3AEf5NPmfiy2Pd6LNbNYeZTdxgyBBUS1fOpY
	4UMekOMrN8hJ/6kf/unVki7Fg8vArOXyFpUXZ4aVp6QEDhOeLxH/pheRpWSs+fNxMQYL7Jw+Dtn
	NjJpcSc+sFsAfWSsvOm5Jcp5PYOZjjVckGlSPkIg4PywjdnBKnHAETfuuTwjw/M/bS9wKscqhjS
	BmyYuVW9nv67mmTEy5Bpy45oZ/bdNtMYFGql5iJzD8Zk1bf6Osj9SU5uoX6QttQJGrkDfwGHxS3
	MeVBSm/i4bz9hqxofGBqdg/cJ5cM22su6eiIxA1f0RG1mOLTBuDGkRK2HONLwCgn5TW5PEFC+Gt
	qggJvUcLdom68otTk0yf3IoYeO5M4HN88Yzt5HBnRPfN1vLOlvOs21AlVSVjzjH/3qXobEIJVNU
	LW+MoONtLnNpP+hec=
X-Received: by 2002:a05:600c:a214:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490a2948f0cmr117371305e9.25.1780309738534;
        Mon, 01 Jun 2026 03:28:58 -0700 (PDT)
X-Received: by 2002:a05:600c:a214:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490a2948f0cmr117370965e9.25.1780309738117;
        Mon, 01 Jun 2026 03:28:58 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ae3901cesm8445615e9.7.2026.06.01.03.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:28:57 -0700 (PDT)
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
Subject: Re: [PATCH v4 07/10] drm/damage-helper: Remove old state from
 drm_atomic_helper_damage_iter_init()
In-Reply-To: <20260530185716.65688-8-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-8-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:28:56 +0200
Message-ID: <87h5nmlfkn.fsf@ocarina.mail-host-address-is-not-set>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14845-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,linux.intel.com,redhat.com,gmail.com,ffwll.ch,kodeit.net,proton.me,crapouillou.net,outlook.com,broadcom.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,ocarina.mail-host-address-is-not-set:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,suse.de:email]
X-Rspamd-Queue-Id: F111E61D763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Nothing in drm_atomic_helper_damage_iter_init() requires the old
> plane state. Remove the parameter and mass-convert callers.
>
> Most callers now no longer require the old plane state in their plane's
> atomic_update helper. Remove it as well.
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


