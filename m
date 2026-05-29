Return-Path: <linux-mips+bounces-14821-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNm8HoWNGWpTxggAu9opvQ
	(envelope-from <linux-mips+bounces-14821-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 14:58:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329C60293E
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 14:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D26E301912B
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 12:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4CF2D739B;
	Fri, 29 May 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKme3PJu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B92C21E8;
	Fri, 29 May 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059348; cv=none; b=eYuLjFCUiRkTpW9vHJAtjKJH3Orpaf487dqPJFQ1aW3i/ZqN8V87dKqQ5R6FQ++ckPJwvXi0umdBNRRl2xaOdxtrpQNJcsm0Nw5hWTU0lkpvUFxRzv63AmJ5qdA0ErXBoecFzJlSMc8Gx7EPKyKRD7DIj0kHkI1vRKGoGiz7YIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059348; c=relaxed/simple;
	bh=rf9ietTEoUdNUWP+4Xs/on4TPwZiiiKAB2KYgWpPhmg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I1kTxr6A2QhFCoXObyPg9oLOdWIYUQlAPs6e8Neo7Rg4OpNdfxcFbZAlB/GatxFAeJlPcOF8wC1ffzy9yQNj/Vtv7C06fMqkJ1qHz9zCwJpX/rrmiKUKbD3whm0IUXYuSU57OdJkErnZjt17CAt9CaL9v6ymsAT+HDoEZpVifQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKme3PJu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6271F00893;
	Fri, 29 May 2026 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780059346;
	bh=+6AiMcZa3bd0LPjamkN4r9S9jW+Apu//pCbttaoWdDI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HKme3PJuW/g8Xe3fa9pH4ndcExyYxHcd2cNlg9NECKqK4v1asLZhvhZEXzEeGPFwC
	 krMU26G83m8iPSglCfYKCqgciw6JWvcuzjQUTI3wFtoI62nF0UChddzGFraXimF9pJ
	 1k54Uu9U94IdLdsnRGH4hwmLSLP/pSSK0uKpJsDzqk30FcWpIwESOtKLiumR4V+6As
	 unm055hDnQ1A4hKk4u4dzRoTU87SIvLvelBGdBip7ZDoIZon4MXvQ/IpRhuSbyjuUY
	 udebOV+LpQuBbeFt6sWaU5lZ0itKuFGMHeMAFQa8OxgbyKZLGpVxsvBB1IjU2d1o4J
	 48Eb2LMB+rd1A==
From: Srinivas Kandagatla <srini@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Mark Brown <broonie@opensource.wolfsonmicro.com>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Peter Chen <peter.chen@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/23] driver core: count references of the
 platform device's fwnode, not OF node
Message-Id: <178005933352.9337.17178239685242465219.b4-ty@kernel.org>
Date: Fri, 29 May 2026 13:55:33 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14821-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3329C60293E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 21 May 2026 10:36:23 +0200, Bartosz Golaszewski wrote:
> I'd like to first apologize for the long, treewide series and an
> extensive Cc list but I think it's important to show the big picture and
> the end result of this rework.
> 
> Platform device core provides helper interfaces for dealing with
> dynamically created platform devices. Most users should use
> platform_device_register_full() which encapsulates most of the
> operations but some modules will want to use the split approach of
> calling platform_device_alloc() + platform_device_add() separately for
> various reasons.
> 
> [...]

Applied, thanks!

[03/23] slimbus: qcom-ngd-ctrl: fix OF node refcount
        commit: 0208edaf0b32cae5b922729c4ef52dcd865e2e19

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


