Return-Path: <linux-mips+bounces-13782-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCJuJiW0u2k8mgIAu9opvQ
	(envelope-from <linux-mips+bounces-13782-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 09:30:29 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2572C7E59
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 09:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AE7F3138CC0
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 08:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462273A9D84;
	Thu, 19 Mar 2026 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+AgGMCS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8pcZ2dwV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+AgGMCS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8pcZ2dwV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD43A9622
	for <linux-mips@vger.kernel.org>; Thu, 19 Mar 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908967; cv=none; b=HZ9eqsIHhIK37qQDkZqwEzuIS2651HZSbi3sswsIbbZ2DzS7g74BWArwYdqxWC0OmpyTVAm64Aplt3JPSb+KMeYE2Nrf+hRs5tqevlXWPXM6PiDA+6suFCbsl/aaEEL+kPKfUtj40W490gXhbcQLhZEESiFDRZ6WH+tCsenBj90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908967; c=relaxed/simple;
	bh=pJVhq7hxbXIQ7CKLqDq7kL2nsX95Dyjd3xsfL2oMuOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lb34QGx0tMtWZLM5KdgKJsh2R7PNY5rLVd9XVV8/6/kr611EGLU8cfvbsV4wzJ3C+Blop+mAt6UsM+1lEfQexuEHMMHyiDLoXHkbk09hWu9BiNDl998+MBGvOJw67pA2OqswlmXDbuD6zWEVgXduQ/45mQsWX1FQ7pwnUhsBaAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+AgGMCS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8pcZ2dwV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+AgGMCS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8pcZ2dwV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0919C5BD23;
	Thu, 19 Mar 2026 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773908962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uepIOdIe1KDBAdOR2nVFfKPb1oLN4//z8c2D1VPKCns=;
	b=S+AgGMCSXeJliUMRbJImB4/IfpfwkHgvUO7xXbehPl6BSsU8qP1/tqAKtzzkZ2TDvspYYM
	xp0lW+/DeyF2ROg5CCKt7W413Tzs9QFuTE8fEf0Qw/viAUB9yDKBheoXXyIRQx/03PkbJe
	IB7wGLlKvhu6a/xa7SqJUfO8erhCdCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773908962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uepIOdIe1KDBAdOR2nVFfKPb1oLN4//z8c2D1VPKCns=;
	b=8pcZ2dwVitZL8DLsqHjvhQci1vcFMh5jy1/u9c91WLJ82iDazWply9/R8OnN7C09QiHQF0
	RYdYYThEEJTD97Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773908962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uepIOdIe1KDBAdOR2nVFfKPb1oLN4//z8c2D1VPKCns=;
	b=S+AgGMCSXeJliUMRbJImB4/IfpfwkHgvUO7xXbehPl6BSsU8qP1/tqAKtzzkZ2TDvspYYM
	xp0lW+/DeyF2ROg5CCKt7W413Tzs9QFuTE8fEf0Qw/viAUB9yDKBheoXXyIRQx/03PkbJe
	IB7wGLlKvhu6a/xa7SqJUfO8erhCdCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773908962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uepIOdIe1KDBAdOR2nVFfKPb1oLN4//z8c2D1VPKCns=;
	b=8pcZ2dwVitZL8DLsqHjvhQci1vcFMh5jy1/u9c91WLJ82iDazWply9/R8OnN7C09QiHQF0
	RYdYYThEEJTD97Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 030304273B;
	Thu, 19 Mar 2026 08:29:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JuLvOeCzu2n6dgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Mar 2026 08:29:20 +0000
Message-ID: <29c59b0f-c86c-4197-8cf5-47e4132c730b@suse.de>
Date: Thu, 19 Mar 2026 09:29:20 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] drm/atomic: Allocate drm_private_state through a
 callback
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Jessica Zhang <jesszhan0024@gmail.com>
References: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13782-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,igalia.com,ideasonboard.com,gmail.com,nvidia.com,vger.kernel.org,oss.qualcomm.com,arm.com,intel.com,linaro.org,kernel.org,crapouillou.net,raspberrypi.com,kwiboo.se,linux.dev,poorly.run,somainline.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid,suse.com:url]
X-Rspamd-Queue-Id: 0E2572C7E59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

Am 24.02.26 um 17:10 schrieb Maxime Ripard:
> Hi,
>
> This series started from my work on the hardware state readout[1], and
> was suggested by Dmitry[2].
>
> This series deal with the fact that drm_private_obj (and thus bridges)
> are not initialized using the same pattern than any other object. This
> series solves that inconsistency by aligning it to what we're doing for
> all the other objects.
>
> This was tested on a TI SK-AM62, with three bridges.
>
> Let me know what you think,
> Maxime
>
> 1: https://lore.kernel.org/dri-devel/20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org/
> 2: https://lore.kernel.org/dri-devel/zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x/
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v5:
> - Rebase to drm-misc-next
> - Link to v4: https://lore.kernel.org/r/20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com
>
> Changes in v4:
> - Fix a circular dependencies between modules by calling
>    __drm_atomic_helper_private_obj_create_state from
>    __drm_atomic_helper_bridge_reset instead of
>    drm_bridge_atomic_create_priv_state()
> - Link to v3: https://lore.kernel.org/r/20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com
>
> Changes in v3:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v2: https://lore.kernel.org/r/20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org
>
> Changes in v2:
> - Switch to a new hook instead of reset since some drm_private_objs want
>    to persist across suspends
> - Drop the call to drm_private_obj_funcs.reset in
>    drm_mode_config_reset()
> - Link to v1: https://lore.kernel.org/r/20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org
>
> ---
> Maxime Ripard (4):
>        drm/amdgpu: Switch private_obj initialization to atomic_create_state
>        drm/omapdrm: Switch private_obj initialization to atomic_create_state
>        drm/tegra: Switch private_obj initialization to atomic_create_state
>        drm/atomic: Remove state argument to drm_atomic_private_obj_init

Nice cleanup. For the whole series:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 51 ++++++++++++----------
>   .../drm/arm/display/komeda/komeda_private_obj.c    | 16 +++----
>   drivers/gpu/drm/display/drm_dp_mst_topology.c      |  1 -
>   drivers/gpu/drm/display/drm_dp_tunnel.c            |  2 +-
>   drivers/gpu/drm/drm_atomic.c                       | 22 +++-------
>   drivers/gpu/drm/drm_bridge.c                       |  1 -
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  2 +-
>   drivers/gpu/drm/ingenic/ingenic-ipu.c              |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  1 -
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  1 -
>   drivers/gpu/drm/omapdrm/omap_drv.c                 | 22 +++++++---
>   drivers/gpu/drm/tegra/hub.c                        | 22 +++++++---
>   drivers/gpu/drm/vc4/vc4_kms.c                      |  4 +-
>   include/drm/drm_atomic.h                           |  1 -
>   14 files changed, 76 insertions(+), 72 deletions(-)
> ---
> base-commit: 196b2b95fec447c2c4460f753b277d840633fbef
> change-id: 20251008-drm-private-obj-reset-ae1e2741027a
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



