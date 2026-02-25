Return-Path: <linux-mips+bounces-13218-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPABM08qn2kOZQQAu9opvQ
	(envelope-from <linux-mips+bounces-13218-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:58:55 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 483F719B162
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78124305A2DC
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 16:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0A93E8C49;
	Wed, 25 Feb 2026 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Be/6GpfI"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AB13E8C4C;
	Wed, 25 Feb 2026 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038513; cv=none; b=KQcSxKZ4Gj42BXLN2Ws1+kRcxM/9GPqwhF97f7SaiyVFXyV5D33YANw6jQXIwJPU/QK4fHnAFLUw4ScXGYc8kXDEP56ST4pyWULtDTLWN3VPG9PdR+hH9iJdTDSnSQD882UM5fcUMyvbp3NyJLagyciEu0/QVVWpd6otBbnFmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038513; c=relaxed/simple;
	bh=MrxK+FXi+rxr6xh0EutGCAfELz46wFmxMLkwr+gKRdY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tlNKq7Q7kvJd9dJgUDb6gknVtyn29CBPdkdFriuK8FNyCDymY1SpdGZQsSGpjfVAAm0ud7+d50hxIJ0528RIoJ57lcTjMdU5cIUPxROPVVG71we9IYo7fPnh1NGMLO42JsGmNMLfOrTgCYl5GYPRdazZfTghAj1g1O68wQpqtbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Be/6GpfI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CFF26C143FD;
	Wed, 25 Feb 2026 16:55:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B70AE5FDE6;
	Wed, 25 Feb 2026 16:55:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB12F103692ED;
	Wed, 25 Feb 2026 17:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=KCdnJLstpDSNyc0cPVzxxnZ6KzlUUTQG4vXTkzm3GMQ=;
	b=Be/6GpfIObmcN2JJ5p7IK2aBcafUDE92W9Q3wibmqH1pDABuSJqUYHfmJSh7qGoWvDuXFe
	aU7bZRYlNOSWr6I5sszv4dnxChOZE67FBtxn0Gq0W3n0wYr2SoRwsTR72UJLEMTbxuKoNK
	Oqih1+UDD9Lj9nMO9NWPMXQasl0K0qliW32Rz98P1C/cXWrfhLv/dVI0OIBdvQfuEXKrYX
	dAkKEBwe7eIJFUaYG96u5QMZ6HFXL7LnXPw22DrGMlmx3ELdn9aTokxuejz7Qp5hxd1j4r
	ZLl/0jpAz8PnfhBb8U3O3ZBoYGFjDE7E4NtAbd2ItTHlyqfcL/rHL15aPqslNg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v7 0/3] clk: eyeq: instantiate generic PHY children
 auxiliary device
Date: Wed, 25 Feb 2026 17:55:04 +0100
Message-Id: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Py2rDMBCF4VcJWldFM7p31fcoXegyqgVNHOxgG
 oLfvXKgRMVZnkHfD7qxmaZKM3s73NhES53reGrDvhxYGsLpi3jNbTMUqEEg8mNIkZ+HK0eISRH
 kEqNl7fl5olJ/7qmPz7aHOl/G6XovL7Bdn0QW4IIX9AVdCWQR3uM4Xr7r6TWNR7ZlFnxQENBRb
 DSBBk9UwGS5p7Kj4DsqGyUfbCRwJsgnVHUUVUdVo17rZFAHB8HuqX5QBN1R3WjwuVCQPgep9tT
 8USMAbUfN9tecnRLaOXDuP13X9RfdNKesyQEAAA==
X-Change-ID: 20251022-macb-phy-21bc4e1dfbb7
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13218-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 483F719B162
X-Rspamd-Action: no action

EyeQ5 SoCs integrate two GEM instances. A system-controller register
region named "OLB" has some control over the Ethernet PHY integration.

Extend the current OLB ecosystem with a new generic PHY driver.
 - OLB is carried by one main platform driver: clk-eyeq.
 - It instantiates auxiliary devices: reset-eyeq & pinctrl-eyeq5.
 - We add a new one: phy-eyeq5-eth.

Mainly we spawn a new auxdev from clk-eyeq. But alongside we use the
newly introduced helper devm_auxiliary_device_create() that has the
implication of setting child dev->of_node from parent. That implies we
must drop the device_set_of_node_from_dev() at the same time.

Philipp Zabel gave his ACK [2] for the reset patch to go into linux-clk.

About related patches:

 - PHY patches are incoming to add the driver. Patches used to be [2] in
   the same series.

 - MIPS patches are incoming to add MACB/GEM instances in devicetree and
   their associated PHYs. They also update dt-bindings to reflect this
   new feature OLB provides. Patches used to be [2] in the same series.

Have a nice day,
Thanks!
Théo

[0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
[1]: https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.com/
[2]: https://lore.kernel.org/lkml/9506997c56808cc9fd58fe0d384976421d6c9bfc.camel@pengutronix.de/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v7:
- Separate PHY / clk / MIPS patches into three series.
- Rebase onto v7.0-rc1 and test on EyeQ5. Nothing to report.
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
Jerome Brunet (1):
      clk: eyeq: use the auxiliary device creation helper

Théo Lebrun (2):
      clk: eyeq: add EyeQ5 children auxiliary device for generic PHYs
      reset: eyeq: drop device_set_of_node_from_dev() done by parent

 drivers/clk/clk-eyeq.c     | 60 ++++++++++++----------------------------------
 drivers/reset/reset-eyeq.c | 24 ++-----------------
 2 files changed, 17 insertions(+), 67 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251022-macb-phy-21bc4e1dfbb7

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


