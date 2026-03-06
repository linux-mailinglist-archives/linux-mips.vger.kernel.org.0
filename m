Return-Path: <linux-mips+bounces-13388-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIw7EA/lqmkTYAEAu9opvQ
	(envelope-from <linux-mips+bounces-13388-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 15:30:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF38222B61
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 15:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D863301DEE3
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2026 14:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D533A9D84;
	Fri,  6 Mar 2026 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jwZYg/7r"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002D539FCB8
	for <linux-mips@vger.kernel.org>; Fri,  6 Mar 2026 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807416; cv=none; b=WyUtkvBfrg0y/BoPdRHTDp5KAyXK7+2IgUset7GLwJLYPB8m/qrfXOtXBKSH8Eu0GIUgA0YC9b6KCFtHTyt9dbCZe0nYa8LSivgIv6JlmfJzEWUperrU3wmsjM735utCaps9m3gbIX2sVSvQtJ8ZoUEozBsNz4vZKAxrqwodyyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807416; c=relaxed/simple;
	bh=3/CiW7/aeUoQUXGFAD9+PAPSxu3ZtUkHf1MdtiMWQHg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O54sQOOSYqkwYMjA+Cs470+G1x5ELy50i1scKWfm2TKl4d2knjTBZMhkyho88FsIy9mNKN1gcHIvmTGoYi24nwNyiUxKeBeP7uNuA22U2rA05nOybi538sbPYpT/9m1cYiKDBWgYjYrJjdg4J3VncWSHw4iBMNftGDRpyuuzD5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jwZYg/7r; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 20EACC40432
	for <linux-mips@vger.kernel.org>; Fri,  6 Mar 2026 14:30:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 02E4D5FF92;
	Fri,  6 Mar 2026 14:30:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84A4A103699EC;
	Fri,  6 Mar 2026 15:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772807407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kQXDOeUElMP86vYZdV9oYHwI/cJyGb8bL0hd67H7k7I=;
	b=jwZYg/7rWFZ05nl1s7kXaym8UKwjPE9LxZ/3jpOyYatVsRb/VgbHbR6Ugbl3bV8DK4/zM1
	f9Sx/K8FnKyzTK8+n7Y1Z+v+Mp1vE2ocf1Na65CbvLTIp91S+Ey85+aRjzz5GTTqeu3Wq7
	S3QglYKl+eylxtx/EawgpeTBk7LB3YHAjY0l+T2OJEW8Uu5kEbHMXNl9A8We6fZBuvQGiW
	0aGk8WFkSyU9Zhvkoitui6tN3nLZS6aj8HRy+jUAYBCi96+PxibhdlSu+OA7yEachnhNwm
	rLtmkc46nYpNWpCW0iOo43e/q24EFGlHwpeSy7jB9cKrRo6PeDM7H2cTn7PBOg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v8] phy: Add generic PHY driver used by MACB/GEM on EyeQ5
Date: Fri, 06 Mar 2026 15:29:16 +0100
Message-Id: <20260306-macb-phy-v8-0-b5c48ee61402@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALzkqmkC/23Py2rDMBAF0F8JWldFM9azq/5H6UKPUS1o7GAH0
 xD875UDxSrO8g5z7jB3NtNUaGZvpzubaClzGYca7MuJxd4PX8RLqpmhQAUCkZ99DPzS3zhCiJI
 g5RAMq+uXiXL5eVR9fNbcl/k6TrdH8wLb9EnJAlzwjC6jzZ4MwnsYx+t3GV7jeGZbzYI7BQENx
 UojKHBEGXTqjrRrKLiGdpWS8yYQWO27J1Q2FGVDZaVOqahReQveHKnaKYJqqKrUu5TJdy75Th6
 p/qNaAJqG6u3XlKwUylqw9kjNThHbq2b7VSGA15CC0v/puq6/N+NiCAQCAAA=
X-Change-ID: 20251022-macb-phy-21bc4e1dfbb7
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: ABF38222B61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13388-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

EyeQ5 SoCs integrate two GEM instances. A system-controller register
region named "OLB" has some control over the Ethernet PHY integration.

Extend the current OLB ecosystem with a new generic PHY driver.
 - OLB is carried by one main platform driver: clk-eyeq.
 - It instantiates auxiliary devices: reset-eyeq & pinctrl-eyeq5.
 - We add a new one: phy-eyeq5-eth.

About related patches:

 - The MACB series [1] has been merged in v6.19-rc1. It makes MACB
   consume a generic PHY from devicetree with the EyeQ5 compatible.

 - clk patches are on the lkml [3]; they make clk-eyeq instantiate this
   new auxiliary device. They also ensure we get a dev->of_node
   assigned. Patches used to be [2] in the same series.

 - MIPS patches are on the lkml [4]; they add MACB/GEM instances in
   devicetree and their associated PHYs. They also update dt-bindings
   to reflect this new feature OLB provides. Patches used to be [2] in
   the same series.

Have a nice day,
Thanks!
Théo

[0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
[1]: https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.com/
[2]: https://lore.kernel.org/all/20260127-macb-phy-v6-0-cdd840588188@bootlin.com/
[3]: https://lore.kernel.org/all/20260225-macb-phy-v7-0-665bd8619d51@bootlin.com/
[4]: https://lore.kernel.org/all/20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v8:
- Rebase upon linux-phy/next. Drop sorting Kconfig/Makefile patch
  because one exists upstream.
- Instead of storing a phy_interface_t to know which submode to target,
  store a custom enum with two states (RGMII/SGMII). Ignore RGMII
  timings in this generic PHY driver because they are handled by the
  net PHY.
- eq5_phy_set_mode() calls into eq5_phy_validate() and now propagates
  its error return value. Previously it shadowed EINVAL with EOPNOTSUPP.
- Link to v7: https://lore.kernel.org/r/20260225-macb-phy-v7-0-e5211a61db56@bootlin.com

Changes in v7:
- Separate PHY / clk / MIPS patches into three series.
- Implement phy_validate().
- phy_power_on() now supports being called without a prior
  phy_set_mode() because at probe we read the hardware state to
  initialise inst->phy_instance.
- phy_set_mode() now support being called while the PHY is powered on.
- Add sgmii_support bool for each PHY instance to reject SGMII
  configuration on PHY 1 which only supports RGMII.
- Drop dev_dbg() calls.
- Drop readl(gp) in phy_init().
- Replace inst->priv field by inst->dev; that is the only value we need
  from the driver private data. Drop priv->dev field that is unused.
- Call into phy_exit() from phy_init() as the sequence is the same.
  Add comment to explain the reasoning.
- Take Reviewed-by: Luca on "phy: sort Kconfig and Makefile".
- Rebase onto v7.0-rc1 and test on EyeQ5. Only diff to report:
  PHY_COMMON_PROPS and PHY_COMMON_PROPS_TEST are kept at the top in the
  sorting patch; we do not strictly respect an alphabetical ordering.
- Link to v6: https://lore.kernel.org/r/20260127-macb-phy-v6-0-cdd840588188@bootlin.com

Changes in v6:
- Rebase upon v6.19-rc7; nothing to report.
- Add new patch "phy: sort Kconfig and Makefile".
- phy-eyeq5-eth: drop useless explicit __iomem cast to
  dev_get_platdata() return value.
- I did *not* drop the Kconfig `default MACH_EYEQ5` nor driver
  `dev_dbg()`. I think both are useful and should be kept. See
  last revision discussion here:
  https://lore.kernel.org/lkml/DFGSMN8268O0.33TYCQDBVHUHZ@bootlin.com/
- Link to v5: https://lore.kernel.org/r/20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com

Changes in v5:
- phy-eyeq5-eth:
  - fix #includes: add delay, gfp_types, module and drop array_size,
    bug, cleanup, container_of, lockdep, mutex.
  - eq5_phy_xlate(): avoid magic value, use EQ5_PHY_COUNT.
  - use dev_err_probe() in error cases of devm_phy_create() and
    devm_of_phy_provider_register().
- 3x Reviewed-by: Luca Ceresoli.
- Add Neil Armstrong to Cc as new PHY subsystem reviewer.
- Rebase on v6.19-rc1, tested on hardware, no changes.
- Link to v4: https://lore.kernel.org/r/20251124-macb-phy-v4-0-955c625a81a7@bootlin.com

Changes in v4:
- Append my SoB to Jerome's patch:
  [PATCH v4 3/7] clk: eyeq: use the auxiliary device creation helper
- Rebase on net-next & linux-{clk,mips,phy}. Nothing to report.
- Link to v3: https://lore.kernel.org/r/20251119-macb-phy-v3-0-e9a7be186a33@bootlin.com

Changes in v3:
- Take Philipp Zabel's Reviewed-by & Acked-by trailers on reset patch.
- Take Thomas Bogendoerfer's two Acked-by trailers on DT patches.
- Rebase on net-next & test on target. Nothing to report.
- Link to v2: https://lore.kernel.org/r/20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com

Changes in v2:
- Take Acked-by: Conor Dooley on dt-bindings-patch.
- s/%ld/%tu/ for printing ptrdiff_t; warnings on 32-bit archs.
  Reported by NIPA's netdev/build_32bit test.
  https://patchwork.kernel.org/project/netdevbpf/patch/20251021-macb-eyeq5-v1-7-3b0b5a9d2f85@bootlin.com/
  https://netdev.bots.linux.dev/static/nipa/1014126/14277857/build_32bit/stderr
- Link to v1: https://lore.kernel.org/r/20251022-macb-phy-v1-0-f29f28fae721@bootlin.com

Changes since MACB V1:
- Drop the old "mobileye,olb" properties from DT patches; found while
  running dtbs_check and dt_binding_check.
- Drop all patches targeting net-next. That is MACB dt-bindings patch
  and MACB driver code. See there here [1].
- Link to v1: https://lore.kernel.org/lkml/20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com/

Past versions of MACB patches:
 - March 2025: [PATCH net-next 00/13] Support the Cadence MACB/GEM
   instances on Mobileye EyeQ5 SoCs
   https://lore.kernel.org/lkml/20250321-macb-v1-0-537b7e37971d@bootlin.com/
 - June 2025: [PATCH net-next v2 00/18] Support the Cadence MACB/GEM
   instances on Mobileye EyeQ5 SoCs
   https://lore.kernel.org/lkml/20250627-macb-v2-0-ff8207d0bb77@bootlin.com/
 - August 2025: [PATCH net v3 00/16] net: macb: various fixes & cleanup
   https://lore.kernel.org/lkml/20250808-macb-fixes-v3-0-08f1fcb5179f@bootlin.com/

---
Théo Lebrun (1):
      phy: Add driver for EyeQ5 Ethernet PHY wrapper

 MAINTAINERS                 |   1 +
 drivers/phy/Kconfig         |  13 ++
 drivers/phy/Makefile        |   1 +
 drivers/phy/phy-eyeq5-eth.c | 280 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 295 insertions(+)
---
base-commit: caf08514bbee0736c31d8d4f406e3415cdf726bb
change-id: 20251022-macb-phy-21bc4e1dfbb7

Best regards,
--  
Théo Lebrun <theo.lebrun@bootlin.com>


