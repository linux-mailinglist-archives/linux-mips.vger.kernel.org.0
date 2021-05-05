Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881493743B6
	for <lists+linux-mips@lfdr.de>; Wed,  5 May 2021 19:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234378AbhEEQve (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 12:51:34 -0400
Received: from [115.28.160.31] ([115.28.160.31]:46574 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S236095AbhEEQrr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 May 2021 12:47:47 -0400
Received: from ld50.lan (unknown [101.224.80.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E4D5C600BB;
        Thu,  6 May 2021 00:39:19 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1620232760; bh=vx2b9SDlVsCxcZQpwe+BPwvZaY58DskBa9Xh3l9tEsU=;
        h=From:To:Cc:Subject:Date:From;
        b=Iv6fvd4LG7IJZ4UiEwXerPPa0GGFiS1lx/U1JkiqAzBNKqHzYUkjlL4kCLVhXZgR8
         5STrugC+hrEN6Gt7ixDqaNnxIPAV7QGUvVuH2nAL8f36lxgixABrJGtsV+uuTl9V60
         G6ETTQMHFI79jXudUgHUs2KO5WV5xIBTMZdM7l5o=
From:   WANG Xuerui <git@xen0n.name>
To:     linux-rtc@vger.kernel.org
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Date:   Thu,  6 May 2021 00:38:59 +0800
Message-Id: <20210505163905.1199923-1-git@xen0n.name>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It has been a while since v1 of this series was sent (2020-09);
apparently, I did not have enough time or resource figuring out the exact
difference between rtc-ls1x and rtc-ls2x to see if the two can in fact be
merged, even today. Sorry for the long delay!

According to the manuals, though, the initialization sequence and
bitfield descriptions look certainly different, so I'm a bit wary about
just going ahead and merging these. Per Tiezhu's suggestion in the
previous thread, I'm just re-submitting this series with tags collected
and Huacai's e-mail address updated. If anyone (probably Loongson guys?)
could provide more information regarding the possible merger of rtc-ls1x
and rtc-ls2x, that would be great.

This patch series adds support for the RTC module found on various
Loongson systems with the Loongson-2K SoC or the LS7A bridge chip.
The driver is rewritten from an out-of-tree version to meet mainline
standards. I write kernel code as a hobby, though, so there might still
be overlooked issues. Any suggestions are welcome.

Note that, the Loongson-2K platform was upstreamed after v1 of this
series, so v2 additionally contains enablement for it. I'm unable to
test with my 2K board now, however, so Loongson guys, please test this
series again on your collection of LS7A and 2K systems, thanks!

v2:
- Rebased on top of latest linux-next
- Updated Huacai's e-mail address to the kernel.org one
- Added collected tags
- Added adaptation for newly upstreamed Loongson-2K platforms

WANG Xuerui (6):
  rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
  dt-bindings: rtc: Add bindings for LS2X RTC
  MIPS: Loongson64: DTS: Add RTC support to LS7A
  MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
  MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
  MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   5 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   5 +
 arch/mips/configs/loongson2k_defconfig        |   1 +
 arch/mips/configs/loongson3_defconfig         |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-ls2x.c                        | 225 ++++++++++++++++++
 8 files changed, 251 insertions(+)
 create mode 100644 drivers/rtc/rtc-ls2x.c

-- 
2.30.1

