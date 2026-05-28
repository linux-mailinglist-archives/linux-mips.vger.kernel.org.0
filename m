Return-Path: <linux-mips+bounces-14811-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHG7KNklGGqZeQgAu9opvQ
	(envelope-from <linux-mips+bounces-14811-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 13:24:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A35F139E
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 13:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C88D2301455B
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2026 11:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E723E2AB1;
	Thu, 28 May 2026 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVJ+Ngzp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28583D3491;
	Thu, 28 May 2026 11:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779967297; cv=none; b=CZ4nGyfyZ2NTyAMr1p/vAtyRgYMIRfGJzoQx/szoxpOzs4khnvEHUhb3gqaYIFn7zeO/HIEfCZnJODbrmaNjsoW1wl02+so3s/uWF/8X5EM/aWS3GgWxVBfHn8hLZd5VkKeuxntft+svktB6lNWj7447hsBD3GAcgQiUXW0IOww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779967297; c=relaxed/simple;
	bh=f/lIC4TgmEzyiBDPh2iBCW6oUeY6y5+TmWqzleJFfvY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bTpRNi9xWi6NAZ9hg0k+E60lA2+4Htrx5oLqKfFJkL0Twj/PB0sg+4xXfYuOEmoHbkcJkie44RshfQQQIQQ0BMlOWdsmbVFcS/WcdIDrcqJ7gdHOwwEKjiK50eD40H/1qf53cbw0kYcCsHBKqRF2xK7IM7S8De1GClnT2ZFE7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVJ+Ngzp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779967296; x=1811503296;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=f/lIC4TgmEzyiBDPh2iBCW6oUeY6y5+TmWqzleJFfvY=;
  b=jVJ+NgzpXSONr+RHbU6qtCCrztJa5bqPUWbPogVG670ahHdbLpztMlD2
   LcExizHgnYSr5uusg/B++Rlg6iY3ewekxdkYBUusP2p7rfcVFPo11YkpY
   +VPfeJRP2cxwEuYP9iJLhpTG/sB5AoyHqXNf9jJf/vAIxkdRz21sV/edC
   S4SvSeeFKau7+FmX0jBDqNtAI+YBLoD+aJwH00RMhKjG2olrfHw7UVCXw
   /K0rmUWzZ/RA5FHPZMUUHeyW6fnweYNoVRYL4PkZQznYCNLx+/O2zcC+6
   bnY4ieUaHTgOJfFSZDlxPvBgnxsB6LKEZq69H+JmWQLRMLwJYD/qQfdsk
   A==;
X-CSE-ConnectionGUID: 81EPxlcyToqpjP3cFLSHKw==
X-CSE-MsgGUID: sRzTGLwxS6OY/9ZIJEHWLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103480346"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="103480346"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:21:34 -0700
X-CSE-ConnectionGUID: NhorkxbETOO3yaxAYXvTkQ==
X-CSE-MsgGUID: vXFsgfpXQNSWfwq2pTGuRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="238337774"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:21:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 14:21:11 +0300 (EEST)
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
cc: Lee Jones <lee@kernel.org>, 
    Mark Brown <broonie@opensource.wolfsonmicro.com>, 
    Thierry Reding <thierry.reding@avionic-design.de>, 
    Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
    Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, Srinivas Kandagatla <srini@kernel.org>, 
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
    Fabio Estevam <festevam@gmail.com>, 
    Matthew Brost <matthew.brost@intel.com>, 
    =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
    Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, Peter Chen <peter.chen@kernel.org>, 
    Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, 
    Philipp Zabel <p.zabel@pengutronix.de>, 
    Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
    driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
    iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
    linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org, 
    dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
    linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 19/23] platform/surface: gpe: use
 platform_device_set_fwnode()
In-Reply-To: <20260521-pdev-fwnode-ref-v1-19-88c324a1b8d2@oss.qualcomm.com>
Message-ID: <bfdbc026-b3f9-971b-aaf0-0485434b8411@linux.intel.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com> <20260521-pdev-fwnode-ref-v1-19-88c324a1b8d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-947565217-1779967271=:1291"
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14811-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 021A35F139E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-947565217-1779967271=:1291
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 21 May 2026, Bartosz Golaszewski wrote:

> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the firmware node for dynamically allocated
> platform devices with the provided helper.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/platform/surface/surface_gpe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/su=
rface/surface_gpe.c
> index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..40896a8544b0a4da4261ea881=
b1eaed62d93b32b 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -317,7 +317,7 @@ static int __init surface_gpe_init(void)
>  =09=09goto err_alloc;
>  =09}
> =20
> -=09pdev->dev.fwnode =3D fwnode;
> +=09platform_device_set_fwnode(pdev, fwnode);
> =20
>  =09status =3D platform_device_add(pdev);
>  =09if (status)
>=20
>=20

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-947565217-1779967271=:1291--

