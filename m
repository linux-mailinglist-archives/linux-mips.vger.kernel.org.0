Return-Path: <linux-mips+bounces-8245-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C89B6A6A3BE
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 11:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B451518959F5
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 10:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AC622258E;
	Thu, 20 Mar 2025 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aq7I16wY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B07033E1;
	Thu, 20 Mar 2025 10:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742466744; cv=none; b=SclRcqN2/M3f3mTLULqdUrpQqohV5OQu4GBePkrTEyYCdu9niCzSUXAh7SwY0vm/HoKGVFMfGOJKR6uigo393tVq9fTJX5QC1cMU/4k6g0ujSbYK3Dv+1Mtnvd4z2sgOZ96diemQbEZTQkW0g6PCsMAAMh2nU/Bu/mNuA7ZKpGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742466744; c=relaxed/simple;
	bh=B13pFH7D4VtuN7xDuQk0J77vKE6wU3ix+q9mqc2aPoU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DYoup8J904WOmGudbeM1v2tn3YqJLJTJJ1ztuhv/fURcHFwIlYhtxpAkOV8uthtygWY5uSMpQXoC1x72uoGU95xkE9GPH+rGIWSyL++Mh7WPyuOKbWgZtxMr5Y56j347PAMsQdUIw9Hohi09vDG07mWJuTLv99NDIC8czYk0OSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aq7I16wY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDF63C4CEDD;
	Thu, 20 Mar 2025 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742466743;
	bh=B13pFH7D4VtuN7xDuQk0J77vKE6wU3ix+q9mqc2aPoU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Aq7I16wYBIbhcg1Kh9KzJ53z0LgMG8D7Q4FyLSxytoFGNW3DWLCBib6+X2BZEc42e
	 kuJXbkS5nnDSEZd8LhyhBx00R7yW92FJcjsJmG+I3BASW+hMmBVifeouGyUMATXzaL
	 57Tcb/gbAbWs/aeJK9xZ13yj2iVw3Ch6WlW2cCX0mvHMJ1MxaDf68gDlnQwGY5Wc9A
	 gmCvA4QYyoklr9rdv2MpqqU9eApNGzllHCyJJi2YwNSJsKG0RxJXsUTmXEL+XKIiOF
	 3m4UNghmvWZhaFLvWIDGR6QnAncVUj5doZLrYpt1HSsAe48HKVoGBZqaEiC2xrsbuW
	 g65EaW52fsUMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CFBC28B30;
	Thu, 20 Mar 2025 10:32:23 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v14 0/2] Add support for Loongson-1 NAND
Date: Thu, 20 Mar 2025 18:31:36 +0800
Message-Id: <20250320-loongson1-nand-v14-0-2fef37c8607f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIju22cC/2XQS07DMBCA4atUWeNqZvwcVtwDsXAcO41oE5SUC
 Kh6d5yKkireWLKl/5uRL9UUxy5O1fPuUo1x7qZu6PMF1dOuCgfft1F0TX6oCEiBRCOOw9C309C
 j6H3fCHaSbGNthGSqHH2MMXVfN/H1Ld/TOJzE+TBGf2cQdD5JEcq9ZbACxXtsP/Os/c8y8aU9+
 e64D8Np8Q7ddB7G79uCs1nUv1XIbleZjQBhE0vEEBMQPEjLKrNdcyWhyG3ODVhng0SVvNrmbs0
 duCJ3OQ9smugVulrhNuc1Zyqnc845BFuzVNqD3OYI/z0CUNEjZAAtGoopOYhUALgChOXvIWagN
 kxBO3aurguA7oCGLJQAZUBLDZaZmyi5AOQKSNAlIDPgde0DoZEYmkfger3+AlecnS+uAgAA
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742466741; l=5453;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=B13pFH7D4VtuN7xDuQk0J77vKE6wU3ix+q9mqc2aPoU=;
 b=9fAErtTyeoVuJCa0k/ynuOBwmenc/vyj4WZTo3dkesSwi8LgealQ2LsyDnMO7f7WGsLOwImD1
 jcIJ8RQszs5BjohLwS5o3txI0YFYwJ3QGT3JNCyx+E2sTxLqOeexfaT
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

Add the driver and dt-binding document for Loongson-1 NAND.

Changes in v14:
- Clean up unnecessary print messages in the driver.
- Some minor related adjustments.
- Link to v13: https://lore.kernel.org/r/20250305-loongson1-nand-v13-0-a5bac21631cd@gmail.com

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
 drivers/mtd/nand/raw/loongson1-nand-controller.c   | 838 +++++++++++++++++++++
 5 files changed, 919 insertions(+)
---
base-commit: 73b8c1dbc2508188e383023080ce6a582ff5f279
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



