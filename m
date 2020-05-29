Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A7A1E73CD
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 05:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436980AbgE2Doc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 23:44:32 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34676 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436711AbgE2Doc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 23:44:32 -0400
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id D79A120C78;
        Fri, 29 May 2020 03:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590723870; bh=0eQlqgW7U08eVzjP2LzMrCsbqr4MkB0jmFuPPb9jrzo=;
        h=From:To:Cc:Subject:Date:From;
        b=FXOsq1NcI2rleGjtCsFIxXA7FXQfE2Yqfuo+M0sX2x1UlshYtq2TffiLS7L6mXfHD
         ZW4w6yqQHMNBP2HJ2KFpmiV1JQ4s2H5dPte2zEWQEnNl0nf6sWWPKnjGGA58tm8HGe
         RkTWFEY3FQSrw92KbtUH1EGYlOg4DvRfZ4wKC9Y/1DWI3+2x2LtkS7UNMU5ER/vH+L
         9wRK8jCY2/q2TkAG1VYwehRFMc6luGyMiB4Wov5iPwCdCv8ZbKBqJgZNXj3S0mqgqz
         ZGxN+0zKxoid+jai2QpfpJNJPYI652E8+soO97C0gD9TZjo4K5qyUVD4EahQqav60J
         LgxDRCDGNecyA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: Loongson64: Initial LS7A PCH support
Date:   Fri, 29 May 2020 11:43:17 +0800
Message-Id: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With this series, LS7A and Loongson-3A4000 is finally supported
note that this series should depend on irqchip support[1], which
is likely to get merged soon.

Thanks.

[1]: https://lkml.org/lkml/2020/5/16/72

Jiaxun Yang (3):
  dt-bindings: mips: Document two Loongson generic boards
  MIPS: Loongson64: DeviceTree for LS7A PCH
  MIPS: Loongson64:Load LS7A dtbs

 .../bindings/mips/loongson/devices.yaml       |   8 +
 arch/mips/boot/dts/loongson/Makefile          |   5 +-
 .../dts/loongson/loongson3-r4-package.dtsi    |  74 +++++++
 .../dts/loongson/loongson3_4core_ls7a.dts     |  25 +++
 .../boot/dts/loongson/loongson3_r4_ls7a.dts   |  10 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 185 ++++++++++++++++++
 .../asm/mach-loongson64/builtin_dtbs.h        |   2 +
 arch/mips/loongson64/env.c                    |  56 +++---
 8 files changed, 342 insertions(+), 23 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/loongson3-r4-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_ls7a.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_r4_ls7a.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls7a-pch.dtsi

-- 
2.27.0.rc0

