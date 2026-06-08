Return-Path: <linux-mips+bounces-14938-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KdeAJ67WJmrqlQIAu9opvQ
	(envelope-from <linux-mips+bounces-14938-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 16:50:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D731657841
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 16:50:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=c89AWtlL;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14938-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14938-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06615300C3BD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1153F3BE647;
	Mon,  8 Jun 2026 14:38:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022D323B638
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 14:38:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929517; cv=none; b=WHRivTpEwaxcquERbDtrTV7yWruBlKwaeMQ+I9kKvqpTSyGLhzK4m9c/b8NAFXTC+hqsiE8YpLEWtDyXSeIX9L/yLgmVCp3DpyiXR6NJgpis+Q3o/oRn6LYchaB34yV8LtGqzJpx+tNGXUGZLFzuA4Xoj/wAeJwmzAQKfMjR84Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929517; c=relaxed/simple;
	bh=5IDQC0N9hLwKhzfVctSnD5d3tcGRpXZXrMdmybD+IeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAhxJVd0TP8POvcAbn7/Nc1i8FFg9oK74kEuO/weoTQ6lO+Bjt7Uk4a36Ff47K+82KWtJKy81920VBOGGcrussIvjHdWQVBwyDt80gxpHhZsHddoVACPm48g9dTFgFpertN+sKom1m1/4ye7GwiGqQ43BAE/zP+Vi2qWe5ggTH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c89AWtlL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AA01F00893;
	Mon,  8 Jun 2026 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929515;
	bh=LDq+IZOdd0UHKtkjABkpSRlTlhPmfnpQIoaMXhvm7EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c89AWtlLwDYJe2spQ0FjraE4eERzvvBbjvTOzPgSnI28UPWIDJvfE2Xoauzf+r5Sw
	 SMiMtREJcElxd0+eMnZ1zswe7cjppJurDxGN5ckE3G1Vmf9C/RQotknieu9rddEaxD
	 lBNsYhm+YwuYCLE+VO1hVxBAAg/xWDKV3/37GdQ6E1LvY0c3uLBT9n0VCHDhYjQVPq
	 ElliafXAcNfy67DPgpXxCoQH9Oy2jJolEL2caaiZQ5X3qmAhEdmF55Y/WHqFpunMiK
	 XWo2RX3QKttTM8r1sP5merYtbvQrZprLLsEnefX+2fv5ShPrrOF7KWiS9kUCSadhyL
	 n1EcrJH/+xKQg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:30 +0200
Subject: [PATCH v2 48/78] drm/ingenic: Switch to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-48-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5IDQC0N9hLwKhzfVctSnD5d3tcGRpXZXrMdmybD+IeU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql6PSm6Z2zl0+K9Bgy6bCUo8FTZFRp0J0Nib+YTW3+
 SqgnGvXMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaSsYSx4Uz9mTmy/jbx0uIV
 O+ZN1M3ZoFBz/vyJaRaGac6fp/z2lQwLEeNb7iz77cA1e+59k1cqMNZZfuYruqmVpWL6TfqCw3M
 WIdZrxyf0njMJWvbn+9s08zbZjXsjzs+7xHP3cHbcMx697VEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14938-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:dri-devel@lists.freedesktop.org,m:mripard@kernel.org,m:paul@crapouillou.net,m:linux-mips@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,suse.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D731657841

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 42c86f195c66..7e569af22391 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1029,11 +1029,11 @@ static const struct drm_encoder_helper_funcs ingenic_drm_encoder_helper_funcs =
 static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
 	.attach			= ingenic_drm_bridge_attach,
 	.atomic_enable		= ingenic_drm_bridge_atomic_enable,
 	.atomic_disable		= ingenic_drm_bridge_atomic_disable,
 	.atomic_check		= ingenic_drm_bridge_atomic_check,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = ingenic_drm_bridge_atomic_get_input_bus_fmts,
 };
 

-- 
2.54.0


