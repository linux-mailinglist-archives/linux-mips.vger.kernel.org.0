Return-Path: <linux-mips+bounces-13222-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEdVJrIqn2kOZQQAu9opvQ
	(envelope-from <linux-mips+bounces-13222-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 18:00:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E20519B1DD
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 18:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 160D93129B1A
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 16:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C003E8C58;
	Wed, 25 Feb 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="taDNJmy6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F63E9F7B
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 16:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038531; cv=none; b=WfWFgaD+khuauWAiPMM95XvpKBtNB8os9+47UlhfsSvw3EEMXaH/kQWaNXwcLFcMrostERoZ58vU6HBzovkNeNipBNPiuwdOACTy8hqQ7KC6lQfYPMQ6rdx9mMkW/PXjNmFRCOhUEwsdpgvGJo7os2tegSsjqCqlIVC6nxkz0eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038531; c=relaxed/simple;
	bh=v7Gs9yPEmzxWgiJUs61QFJI4jBnm/7Eac9L6a/WStEA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XloZ4uWN+QKpvHbJHulqH/dGuJp/p5N5im8UmJd9jq6GpqLCuK9xnzuGCEW8bZLfV2Pd2zxCIgocG0CYngX8LbvIOHfFfcQvkQSmMO8SJVVpBJqJb9xULdRRmAOk3IzTZbotnndwWsIND5+vgy9AmDsnE/L0cUwYtAKkIUyofk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=taDNJmy6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C11871A1327;
	Wed, 25 Feb 2026 16:55:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 941455FDE6;
	Wed, 25 Feb 2026 16:55:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08978103692F0;
	Wed, 25 Feb 2026 17:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038525; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=P0tBT79B4UCEkbfX9SJJbv72lfFm967ARndGjlihcN4=;
	b=taDNJmy6NO4W3E1QdoXjIedXao+cs5MPFdu5KHKixEXBKwptea7cJ1l0gwRHc3yTRd2IqQ
	y5FQreUb29j73eB59x1f5FAkPbhuYf7kVX74MGjbtkjArD0aeeKIWOaHORswu/4IGvGhGn
	Mg9rODlyLricT1tbp8Rs8JexUZtE4vZSZYxGcYgF9vA9pFvhfiY5Hx0/YutFFp/qm5iLxa
	LpoKGMqFdo6Ked9pNpq5PT3EwSrO/DdaJyJazBO00eYAO3X2wXUFU3mG5iUqr/SAr69JCC
	VsFIvqO0ocderz4DeHzMzeAHlvCToJSRONUCFsTmRASSJb4KWc1VMDs+Wo/ttQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v7 0/3] Add MACB/GEM instances on EyeQ5, and their PHYs
Date: Wed, 25 Feb 2026 17:55:21 +0100
Message-Id: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
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
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13222-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 5E20519B1DD
X-Rspamd-Action: no action

EyeQ5 SoCs integrate two GEM instances. A system-controller register
region named "OLB" has some control over the Ethernet PHY integration.

Extend the current OLB ecosystem with a new generic PHY driver.
 - OLB is carried by one main platform driver: clk-eyeq.
 - It instantiates auxiliary devices: reset-eyeq & pinctrl-eyeq5.
 - We add a new one: phy-eyeq5-eth.

Here we update dt-bindings to indicate OLB is a PHY provider. Then we
add MACB/GEM instances in the devicetree, and the PHYs on the eval
board.

About related patches:

 - PHY patches are incoming to add the driver. Patches used to be [2] in
   the same series.

 - clk patches are incoming to make clk-eyeq instantiate this new
   auxiliary device. They also ensure we get a dev->of_node assigned.
   Patches used to be [2] in the same series.

Have a nice day,
Thanks!
Théo

[0]: https://lore.kernel.org/lkml/20250627-macb-v2-15-ff8207d0bb77@bootlin.com/
[1]: https://lore.kernel.org/lkml/20251022-macb-eyeq5-v2-0-7c140abb0581@bootlin.com/

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
Théo Lebrun (3):
      dt-bindings: soc: mobileye: OLB is an Ethernet PHY provider on EyeQ5
      MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet controllers
      MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PHYs

 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  |  7 +++-
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts         | 26 +++++++++++++
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             | 45 ++++++++++++++++++++++
 3 files changed, 77 insertions(+), 1 deletion(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251022-macb-phy-21bc4e1dfbb7

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


