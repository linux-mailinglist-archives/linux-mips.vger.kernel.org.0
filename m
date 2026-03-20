Return-Path: <linux-mips+bounces-13796-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OESmI6sOvWkz6QIAu9opvQ
	(envelope-from <linux-mips+bounces-13796-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:08:59 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2416A2D7C35
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D9F53050A01
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 09:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B07377EBB;
	Fri, 20 Mar 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcvRcE/1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253443161BF;
	Fri, 20 Mar 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997536; cv=none; b=Y6/ZHVEOr4dPCpbiDBFKUTYTzP5TEaA/ss9ZDpTfZEG/rSACxgo9wtX7xJWb9Hcfz0TvFvM+5suUSVWVDwaiU4gZVrQzOCcAX/X8lTTK0sueCAVlhsKaIjgdcHWCQKUjGzu3AZm+GF6F8tq/zDMqJuuCiEfkrvI1xZaEJ0Ly5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997536; c=relaxed/simple;
	bh=1+/V3M72eicHKatX91jOMQbyAysvN6oRz5SSDh43k3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=piVnOhjjtjcejevwgSAdyeLr3l/naBefXtHugmxGlBzXRRdfgbz0ipPLt7tPLFxYnIObZKNzcL8X05YLAvVnJdqmto1AYuMLvrOxh/8olxue6j8E+ZlkxTsdxhTwN+Am3BP+kDlsAvP+o8T0PuCoA5G0/+On5N3rXCMyQKZYxxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcvRcE/1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22591C4CEF7;
	Fri, 20 Mar 2026 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773997535;
	bh=1+/V3M72eicHKatX91jOMQbyAysvN6oRz5SSDh43k3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcvRcE/1AlZ1LeZ6wPkfYP5/RYZNjCMZxUocYBkwsIiIaMUKjzOT51HHNMB5Zkd85
	 fFRt2lS1uOx0lF4ZOkruQg8cr5awaWrPR+zVIuXbBrR5p/+HNhCuciG4owx+mcVOMA
	 0OC9y/yYCAboum5FvrQnYMljnyjJ9Mz7fIDvyuMq6wvSes8wQ7rk1csUqDNhgHowAk
	 V85kOj+gxW/isVA7z6TAiwIuklrtv9iVM58oY+eMF3anFrWiWUF02se2qdIjk72b8U
	 0mMr7ZHck8q+Xzkl5+YARVfoEE1rB8OKKSRI7qin5EH8xDuIAzulM0qp6ZwtPFX/E9
	 CLSJTesLIwlww==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v5 0/4] drm/atomic: Allocate drm_private_state through a callback
Date: Fri, 20 Mar 2026 10:05:30 +0100
Message-ID: <177399752799.2530289.3477869792206272729.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
References: <20260224-drm-private-obj-reset-v5-0-5a72f8ec9934@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13796-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,igalia.com,ideasonboard.com,gmail.com,nvidia.com,vger.kernel.org,oss.qualcomm.com,arm.com,intel.com,linaro.org,kernel.org,crapouillou.net,raspberrypi.com,kwiboo.se,linux.dev,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	NEURAL_HAM(-0.00)[-0.979];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2416A2D7C35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Feb 2026 17:10:25 +0100, Maxime Ripard wrote:
> This series started from my work on the hardware state readout[1], and
> was suggested by Dmitry[2].
> 
> This series deal with the fact that drm_private_obj (and thus bridges)
> are not initialized using the same pattern than any other object. This
> series solves that inconsistency by aligning it to what we're doing for
> all the other objects.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

