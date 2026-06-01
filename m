Return-Path: <linux-mips+bounces-14851-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M3wNl4XHmr2hAkAu9opvQ
	(envelope-from <linux-mips+bounces-14851-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 02 Jun 2026 01:35:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A30E6265AF
	for <lists+linux-mips@lfdr.de>; Tue, 02 Jun 2026 01:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D95C302A509
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 23:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E14437756E;
	Mon,  1 Jun 2026 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwFeM+dK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31C33F590;
	Mon,  1 Jun 2026 23:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780356951; cv=none; b=ZkvjnJeSxJPFANgsg4qd1alWkl94UWguwjfQfucig68WnQr2aJ5sSMPJCeaP+2z9LjX/HH3bonVkGYhh/YY5Ho4WawMR9yFSxNaDB/Bfp5LPMmyOr6FGQLpc3aSedoLjc4GW/ljlZsZ8glZRIsMcM53n1VzTSkiBfoaHkSp4zh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780356951; c=relaxed/simple;
	bh=mu+k5t+nIMpSdNoVyH2bpssgMm+HGMnEOEsZeveBT8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZ7+2Sy49W8OkBelKwRKgbivpVg6LIkE+Lk3X4mQwcCRghJyNGESIHbVWI3g84vHJPoGO633N/P4K8q/zKhBDtwDfgRvrtB+C6RQ2UZ0nzxBP1zfkOh4elUJPq6EWWIChIftFy1iR8Alxvp+Pd4WNi2UaNt093uHf7SWMhQQ+Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwFeM+dK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5639F1F00893;
	Mon,  1 Jun 2026 23:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780356949;
	bh=BsNyXchE0cQ+WrTEzbPCgdBZhaTxYz8ZYh6ODfO6Thc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bwFeM+dKJids5MGHkWeT2lqLmOE+Z22fpYZVG8IarCaPIkYd1ClJLTF0P+KK4TZC1
	 t1HfBIbIgLm2lF9d6SD2H1GRY5GUIy6SJwL9v8EZ3L20jIK/NaVXSt1XPTueO0oIGy
	 y19iXABriAlFUODdDTo2f2+FK6UaosZlP/s7kW+eWFj9kPjNXvxZUpQLix9fiYAVMs
	 qutOmIhrfL9fMTHLsw3ErfIZs150qZpCJg1stHoIzdshVCQp8iYW9sI4ko81gCNtbL
	 eRcz3oBpBUe09WQM6FxiPQKCgb0o3dANEdBD5y5Egf4yKaQOgk8QwaFZYGWRDLloCl
	 38TEpySFeTuzg==
Date: Mon, 1 Jun 2026 18:35:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Doug Berger <opendmb@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Bin Liu <b-liu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, brgl@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	Ulf Hansson <ulfh@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	intel-xe@lists.freedesktop.org, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>, netdev@vger.kernel.org,
	linux-sound@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	linux-mips@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	driver-core@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	imx@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joerg Roedel <joro@8bytes.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	Robin Murphy <robin.murphy@arm.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	Saravana Kannan <saravanak@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>, linux-pm@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>, dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 09/23] of: platform: use platform_device_set_of_node()
Message-ID: <178035694685.195552.1114165096275774254.robh@kernel.org>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
 <20260521-pdev-fwnode-ref-v1-9-88c324a1b8d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-pdev-fwnode-ref-v1-9-88c324a1b8d2@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linux.ibm.com,ti.com,lunn.ch,pengutronix.de,avionic-design.de,ffwll.ch,google.com,vger.kernel.org,kernel.crashing.org,lists.linux.dev,intel.com,broadcom.com,linux.intel.com,lists.infradead.org,davemloft.net,lists.freedesktop.org,ellerman.id.au,crapouillou.net,linuxfoundation.org,8bytes.org,redhat.com,opensource.wolfsonmicro.com,arm.com,nxp.com,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14851-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[65];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6A30E6265AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 21 May 2026 10:36:32 +0200, Bartosz Golaszewski wrote:
> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/of/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


