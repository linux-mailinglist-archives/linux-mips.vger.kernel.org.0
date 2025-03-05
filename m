Return-Path: <linux-mips+bounces-8097-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A267A4FD20
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 12:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A52AD3A745F
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 11:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93359233726;
	Wed,  5 Mar 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWvthIqJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679461EE7B3;
	Wed,  5 Mar 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172712; cv=none; b=BWxrELyDehulsP1bwbcs2Ezp5ORDZTsFMFI2wJd7srUIOmzSe0KqxKagIIsX0jtz/WIXUXJG4GEUF02Uk0msXFiKJ2hwo0JsUGKZi8nku51ls05urpQggeq9D2N4wVOjy8xwkJcmhX1gVYEPhoK9fvR3RwjfWYmeKieRf89lqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172712; c=relaxed/simple;
	bh=A34voqNq/lx46quWlbjuRT9G0iCCqdX+8YpwipXpyE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FpMvGC67UlygsoBXfcRZf55dR6viC97UM8Dd90T0fEpAy+L7Fg/aduVx8Oevnm9TTUR8hsRqvZtil22jIodoN/iAK/b7sByIZys8X9XQWp463xWXJsOoFVNoPVBssAwqx2XyiUcmGmaanHHLBmIJlpeh4eFe49J2x1rnuQRIsWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWvthIqJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAF97C4CEE8;
	Wed,  5 Mar 2025 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741172711;
	bh=A34voqNq/lx46quWlbjuRT9G0iCCqdX+8YpwipXpyE4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oWvthIqJiQIJV5M0nU00B11iFlZfk9qZ+4538HJ6asc0ljf2x2ZRr0tW10XSgO1oS
	 dc/yOWhe1oQngNKi5Q3CTQQwXKoKjYWGN1AcCr67+Ikag8sdibrg6I41tHDnvmX6MA
	 oDZvV9oD0o8slIJIJr+jWSODvr1jJnrvYBQQjFkhu4HgNFK4c/fzM9Tb2q20U4RFwi
	 ztRV8LgnTFAdQQYyBwjpgCMElVUXOVJMQn0AOhwvCZ9O6PTDqFassg88tX2YEW5Fhp
	 oxY1enV5q5NHaRAAATnPG4QzDLJ4vWdiNVIDb5tXanghKtt8xlUYyIICEUR6BHOyVJ
	 NGc2GAt5qXDkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47F5C282E3;
	Wed,  5 Mar 2025 11:05:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v13 0/2] Add support for Loongson-1 NAND
Date: Wed, 05 Mar 2025 19:05:03 +0800
Message-Id: <20250305-loongson1-nand-v13-0-a5bac21631cd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8vyGcC/2XQwW7DIAyA4Vepch6VbQjgnfYe0w4JgRStDVPSR
 duqvvtItS5VuCCB9H+2uFSTH6OfqufdpRr9HKeYhnxB+bSr3KEZei9ilx8qAlIgUYtjSkM/pQH
 F0AydYCvJdMZ4CLrK0cfoQ/y6ia9v+R7GdBLnw+ibO4NQ55MUodwbBiNQvPv+M8/a/ywTX/pTE
 497l06Ld4jTOY3ftwVnvah/q5DZrjJrAcIElojOByB4kJZVZrPmSkKRm5xrMNY4iSo0apvbNbd
 gi9zm3LHufKPQtgq3Oa85Uzmdc87OmZalqhuQ2xzhv0cAKnqEDKBBTT4EC54KAFeAsPw9xAy0m
 snVlq1t2wKgO1BDFkqAMlDLGgwzd17yI3C9Xn8BqDKimm0CAAA=
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741172709; l=5250;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=A34voqNq/lx46quWlbjuRT9G0iCCqdX+8YpwipXpyE4=;
 b=F+f3SXX+hAXIGiykEwZ8MqwBG0UbvYTLiVhBW79MSDkpigv/E2rhuxU3QA1D5C/lNDLnhPAo6
 jV1QmYfrGtRDjgV5JgD3Clz+96CPyZQOWryXsA3aRyzmMU59I4+smX9
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

Add the driver and dt-binding document for Loongson-1 NAND.

Changes in v13:
- Improve ls1x_nand_check_op() to cover all opcode checks and eliminate redundancy.
- Revert ls1x_nand_exec_op().
- Some minor adjustments.
- Link to v12: https://lore.kernel.org/r/20250121-loongson1-nand-v12-0-53507999de39@gmail.com

Changes in v12:
- Add MTD label in the example.
- Use MTD label for mtd->name instead of hardcoded assignment.                                                                                               
- Removed redundant fields addr1_reg and addr2_reg from struct ls1x_nand_op.
- Introduced .set_addr in struct ls1x_nand_host to replace the previous .parse_address,
  and improve its logic using regmap_update_bits() to avoid restoring the row address.
- Improve the logic of ls1x_nand_check_op() to eliminate repetitive checks.
- Add ECC engine type check in ls1x_nand_attach_chip().
- Some minor improvements.
- Link to v11: https://lore.kernel.org/r/20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com

Changes in v11:
- Remove the requirement for 'nand-use-soft-ecc-engine' and 'nand-ecc-algo'.
- Add 'reg-names' to support DMA address.
- Move the DMA address to DT.
- Rename the source file to 'loongson1-nand-controller.c'.
- Improve the logic of ls1x_nand_op_cmd_mapping().
- Improve the logic of ls1x_nand_check_op() to exclude unsupported cases.
- Substitute 'host' for the improper term 'nfc'.
- Some minor fixes and adjustments.
- Link to v10: https://lore.kernel.org/r/20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com

Changes in v10:                                                                                                                                              
- Fix the build error reported by kernel test robot.
  Link: https://lore.kernel.org/oe-kbuild-all/202409220010.vctkHddZ-lkp@intel.com
- Link to v9: https://lore.kernel.org/r/20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com

Changes in v9:
- Change the compatible to 'loongson,ls1*-nand-controller'.
- Rename the dt-binding file to loongson,ls1b-nand-controller.yaml.
- Update MAINTAINERS file accordingly.
- Some minor adjustments.
- Rebasing due to recent upstream changes.
- Link to v8: https://lore.kernel.org/r/20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com

Changes in v8:
- Add a description part.
- Adjust the compatible because the match data for ls1c-nfc differs from ls1b-nfc.
- Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
- Delete the superfluous blank lines.
- Drop NAND_MONOLITHIC_READ and add support for real subpage read instead.
- Simplify the logic of ls1b_nand_parse_address() and ls1c_nand_parse_address().
- Split ls1x_nand_set_controller() into ls1x_nand_parse_instructions()
  and ls1x_nand_trigger_op().
- Implement ls1x_nand_op_cmd_mapping() to convert the opcodes instead of forcing them.
- Add ls1x_nand_check_op().
- Remove struct ls1x_nand after moving its members to struct ls1x_nfc.
- Add the prefix 'LS1X_' for all registers and their bits.
- Drop the macros: nand_readl() and nand_writel().
- Some minor fixes and improvements.
- Link to v7: https://lore.kernel.org/r/20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com

Changes in v7:
- Rename the file to loongson,ls1b-nfc.yaml
- Rename the Kconfig dependency to LOONGSON1_APB_DMA
- Link to v6: https://lore.kernel.org/r/20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com

Changes in v6:
- Amend Kconfig
- Add the dt-binding document
- Modify nand_read_subpage() to allow subpage read by a single operation
- Add DT support for driver
- Use DT data instead of platform data
- Remove MAX_ID_SIZE
- Remove case NAND_OP_CMD_INSTR in ls1x_nand_set_controller()
- Move ECC configuration to ls1x_nand_attach_chip()
- Rename variable "nand" to "ls1x"
- Rename variable "nc" to "nfc"
- Some minor fixes
- Link to v5: https://lore.kernel.org/all/20210520224213.7907-1-keguang.zhang@gmail.com

Changes in v5:
- Update the driver to fit the raw NAND framework.
- Implement exec_op() instead of legacy cmdfunc().
- Use dma_request_chan() instead of dma_request_channel().
- Some minor fixes and cleanups.

Changes in v4:
- Retrieve the controller from nand_hw_control.

Changes in v3:
- Replace __raw_readl/__raw_writel with readl/writel.
- Split ls1x_nand into two structures:
ls1x_nand_chip and ls1x_nand_controller.

Changes in v2:
- Modify the dependency in Kconfig due to the changes of DMA module.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Keguang Zhang (2):
      dt-bindings: mtd: Add Loongson-1 NAND Controller
      mtd: rawnand: Add Loongson-1 NAND Controller Driver

 .../mtd/loongson,ls1b-nand-controller.yaml         |  72 ++
 MAINTAINERS                                        |   1 +
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1-nand-controller.c   | 853 +++++++++++++++++++++
 5 files changed, 934 insertions(+)
---
base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



