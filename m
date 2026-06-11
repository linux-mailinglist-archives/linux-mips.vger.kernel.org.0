Return-Path: <linux-mips+bounces-15053-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bvLBGnOVKmr+swMAu9opvQ
	(envelope-from <linux-mips+bounces-15053-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 13:01:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9B6711E5
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 13:01:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=L+0yuZyr;
	dkim=pass header.d=redhat.com header.s=google header.b=W9dSaYII;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15053-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15053-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B80630B2C1B
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 10:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48913D9DB9;
	Thu, 11 Jun 2026 10:59:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049E3D16E7
	for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 10:59:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175596; cv=none; b=itKMio4Us3ZTM1mW1DxaEuRE9wLLGMGwk3z9rHvx3JOEwPfVpBaWgyPk8jX3+XYJLnK5pijVBhJkI0ICujDw5mwaSG7lJPN8OOWkFqX/abm184PnvTP2J2QjWOvGLUo1jygaT8FhHu17jDv7BDpV5l/dOHAlQmZtXIHiIxo4NA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175596; c=relaxed/simple;
	bh=ifamMReb0BWhkfjGxF//h0cAx/mHBlMkmlRIFK0occw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GYGFMsbBjKs4yFmLkeoTSRqWD4xhC16q0BD6WTjXLMMaazZ04wwvCOI15yGJQUFd0+Y2RkN2Tz4EFR5CcdfWJqoNKJiedeJl24I2PI5wJOfBFTOxBqUJDjKzW/5F6+28GRC3ghAIvCWzRilwPGMpWSq+k6u6RzH+/pPbGV1vdcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+0yuZyr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W9dSaYII; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781175594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OE5i5Cs1x/Y1/tYzMUIth7XXWL2BCwQTkDQ8GlOHrbw=;
	b=L+0yuZyr7x8SshBqqzFPQIjeZUbGtnnudPHnO6+Cw9czcE3qjW1nzDbEU1S1OZGH5GQL/7
	LIc9L6Pk3hOedEZRAU4dpCd3ir/D/Fcw6HoJXdgr36vLlMT9lcoQX6l5Cdig56eVJ3yzOr
	gyMspkTaQCwuBlkWI/N2HQGmEgDkAW4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-yKQU61kENBiILgC9H9e-GQ-1; Thu, 11 Jun 2026 06:59:48 -0400
X-MC-Unique: yKQU61kENBiILgC9H9e-GQ-1
X-Mimecast-MFC-AGG-ID: yKQU61kENBiILgC9H9e-GQ_1781175587
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-46010bc0f1eso4681357f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2026 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781175587; x=1781780387; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OE5i5Cs1x/Y1/tYzMUIth7XXWL2BCwQTkDQ8GlOHrbw=;
        b=W9dSaYIIViGuSop919c8zZJHNXYQPBQUrbxXNpvTsE9g7Rlvbk6QnzEPAIq8ebuDMg
         mWWXpiP7y/sEzWgLErq2MWqBjplFi2vecc4yMgr1sNJPmWKI/UUEbKI2Etc3Uqs0+1Gw
         nj0trW25t7JtMkoy7lahqLX2X0g8QWLe0d+gllhYDYiB5vGsPvjN/AnQJnDlEFoGXdcb
         mqPuLMcBIAwNDzqyOrRUZdTRNcyq1Zzl+6kcy1iH97GFr6GxmDrSbie3RjUT1xocX1Kv
         5bw5ZWYs5NTml2Th7nNMghtGhpEnmR/kBtel69HQISubBILKk1IvcicsKMjTT3pppVFe
         DbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175587; x=1781780387;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE5i5Cs1x/Y1/tYzMUIth7XXWL2BCwQTkDQ8GlOHrbw=;
        b=ZQkG0hOHjSwTfB3reLFwWYm9ILt7uuhn2cYxOSxkS2bn9uzEixKa6yz+Y3A7n2Ta+4
         pFx3KwxD/TbHlWyfwcpxa+LBydHYr+m9/Q8k6zW4nv6dZ8TgGr5AJqdfS5G3sL2m97wE
         aMP977JPjG/sxjLAuwV31kPMOco9qovKHRR5cBw47VaNQM/q7wJLbQUWUHYOXqZYBIxU
         2h3+lHEX3SB1YJf8oHe8h6F6nys6+Y10J6lv0UgmqlOn/pl/BKoJ6v4GGE77Ulhkpaen
         afthda4b4zlJcBAgTGNzFzgUZdUJ/VgMtlXc4yt9V+1FGE2NIvQ+8XokI8pG2FfJU+WD
         tDDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n1Uws7SwedHavCyN4B0fRoYRg95t971sHMH9tZ/OclNJ2Y4bd1FPWp2AX73S95Q9pikZWz28yCzGb@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+DP9N0e3izjucOnAihzgecao/XilMqTVPzBBl+R78Ics5whA
	nrQ+Zo8TKsgEyoBMJ52Z5kSaJHv5qp1PvQx0v9Md+63YI61CeJPMi9ef6skzUA1I2q3qf4tPxQP
	9vCH7JeOU9kPy5Uyr5EXjXGOvELLWg+bomHOUtCYu1EqiwLcHXtu79qYPWI0f2JtDiFdpUM8=
X-Gm-Gg: Acq92OHLeCQKdUjpDZvp3xIKt7CrbMMUXQ909ozX9wyJ/XrR8XAZdXAqNIE0zk2FUBb
	dI0DXf3m3LbknVjc9nIaEKQLnddyZBjNPbna69HU7Cc3H2W7WAGL4vMyHGYvzZpY7CC4vDJgWuG
	zX6TmLh8FNj+7JhLS6IJmjfo0LwakoTQNHr47nkZwHYrXzM8W8GPXwTgeqNiakhTC/fRQ3sIu70
	MOJMDUZyX2f/K/s6uWLUQTQbMWiYO2x9Fd9qtDHwCchNOeq8iPDtxRcDpU6A9BqJLZpHpwMpN9d
	silbKMDrW91vQaohT96QU9KJvAcEkvbU7aE6N7ElmW4LqJ3M5Y6WkIt4AHx62Tsqr/HEfUbivZn
	CKbximz1vdXoIx4v/CEZvhj3izJurJkPDW6RlEEpYe0/N9a4u5axgROJgzJXHk+HnNT48LpdTG2
	BNDkb6ApdrNkGIL7o=
X-Received: by 2002:a05:6000:710:b0:460:1c5b:f25f with SMTP id ffacd0b85a97d-460677b1af7mr3240529f8f.20.1781175587110;
        Thu, 11 Jun 2026 03:59:47 -0700 (PDT)
X-Received: by 2002:a05:6000:710:b0:460:1c5b:f25f with SMTP id ffacd0b85a97d-460677b1af7mr3240484f8f.20.1781175586716;
        Thu, 11 Jun 2026 03:59:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcde3sm81947989f8f.1.2026.06.11.03.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:59:46 -0700 (PDT)
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
 amd-gfx@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 01/15] drm/amd/display: Handle struct
 drm_plane_state.ignore_damage_clips
In-Reply-To: <45aec54a-ec80-48ed-9bcc-84e7bccc11eb@suse.de>
References: <20260610152505.260172-1-tzimmermann@suse.de>
 <20260610152505.260172-2-tzimmermann@suse.de>
 <87y0gl5qw8.fsf@ocarina.mail-host-address-is-not-set>
 <45aec54a-ec80-48ed-9bcc-84e7bccc11eb@suse.de>
Date: Thu, 11 Jun 2026 12:59:44 +0200
Message-ID: <87mrx15om7.fsf@ocarina.mail-host-address-is-not-set>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15053-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.de:email,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4E9B6711E5

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier
>
> Am 11.06.26 um 12:10 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> The mode-setting pipeline can disabled damage clippings for a commit
>>> by setting ignore_damage_clips in struct drm_plane_state. The commit
>>> will then do a full display update.
>>>
>>> Test the flag in DCN code and do a full update in DCN code if it has
>>> been set.
>>>
>>> Commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers
>>> to ignore damage clips") introduced ignore_damage_clips to selectively
>>> ignore damage clipping in certain framebuffer changes. This driver does
>>> not do that, but DRM's damage iterator will soon rely on the flag.
>>> Therefore supporting it here as well make sense for consistency.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")
>> I don't think that a Fixes tag is correct here? Your patch series
>> is changing the 'struct drm_plane_state.ignore_damage_clips' and
>> the changes make sense, but definitely isn't a fix in my opinion.
>
> But shouldn't we have added this test in amdgpu and the other drivers as 
> part of commit 35ed38d58257 ? Sure, these drivers don't use
> ignore_damage_clips, but it's still an inconsistency wrt damage

I don't think so, since the original scope of ignore_damage_clips was for DRM
driver of virtual devices (namely virtio-gpu and vmwgfx). These do per-buffer
uploads instead of per-plane uploads, and so there was a need to force a full
plane update if the framebuffer attached to the plane was changed.

Your series are now extending the scope of ignore_damage_clips to be used by
core helpers and force a full plane update when doing a modeset. This makes
sense to me but it wasn't the original intention of the propery and that is
why I don't think that should be considered a fix.

The only patch that IMO is really a fix for commit 35ed38d58257 is patch #6.
Because is true that the plane state ignore_damage_clips was carried over
when the state was duplicated.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


