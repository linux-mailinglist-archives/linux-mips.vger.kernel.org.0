Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233222C715D
	for <lists+linux-mips@lfdr.de>; Sat, 28 Nov 2020 22:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391371AbgK1V5Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Nov 2020 16:57:16 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:47487 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387418AbgK1V5M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Nov 2020 16:57:12 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdwRi-1kAL7K2rmY-00b77Y; Sat, 28 Nov 2020 22:54:20 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kj8AZ-00027T-9a; Sat, 28 Nov 2020 22:54:16 +0100
Received: (nullmailer pid 4070 invoked by uid 2001);
        Sat, 28 Nov 2020 21:54:14 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Subject: [PATCH v8 0/5] leds: pwm: Make automatic labels work
Date:   Sat, 28 Nov 2020 22:53:48 +0100
Message-Id: <20201128215353.3991-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: e9056562e10c809dee3344e50e145a1f
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:QBfiUPuOf14kX4Nz47jAYJt1cUoOTDn1E/pEQC0D93UIwKSk9LO
 pApkfselXX82TbxUTNh8KHQ+CU+2c4pzwJtAt9bworExKtWkMMo11sQBGbbaRZV4CvXMvnA
 9YBrjc9ERoyaWnteYtxeb1ArUz7jfIMFuB3eBRAU64w3d7VMMmtayx6rnaFNch45egLYrE8
 ndlA9RHZPJuId6tbeCmew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:db2FVXCJ0IQ=:rGUF+QkkUhs0EKaPyIQuUg
 ybFnHRPwkBnLFoJzP1nJuiDJYGMjkgvpHNfYJxhkOZGHhhqCNRb0Ltb6SZlhGIYo9iYB/4GV/
 4hCM3Vpve/XfUOsEGEpDlviPUYPXT+dRUt+wvBYHXc9TFbAJKTYR0QXj33O1ix2/YHCZRiFMS
 13KuMpQPkCGx3Y9ZbSTiEEW4els06BHzfagxTp1J+uTDlYI2xG0g8t1MOgFafvkwk0EEHc6K8
 ZyoznGlLSkcEWOEJgdDfnffdgfsM2u+zzIfNIF+RXTUvJV5Ij1AgcURwSHcbZqBEC5zjUs+p6
 sprAnKWfh3tMH+DBc8RM0osqot7HMr6L633xcdNiBzLSws/ycSa1TWmphHF/JLCakwdGNVq+b
 6V9cGMQzbwbU8Ae1QPCF5ke3HFEBTQDThzImW9foPNqjDdH9no6dCZ1GYks3quFcTwkKsosxR
 tdtiik2UTg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hei hei,

these are the not yet taken patches from a series which originally fixed
a minor issue in the leds pwm driver, then migrated the leds pwm dts
docs to yaml (by request), and then fixed all the dts files triggering
warnings on those new bindings.  The remaining five patches now only fix
warnings, the base fix and the yaml conversion is already taken by
subsystem maintainers.  Although this is only dts content now, I rebased
it on the current for-next tree of the leds subsystem maintainer,
because that contains the yaml-conversion changeset.

Series changelog below …

Greets
Alex

v8:
- rebased series on recent pavel/for-next (post v5.10-rc1)
- removed already applied patches
- added Acked-by on patch 1/5
- updated patch 3/5 based on comments by Ahmad Fatoum

v7:
- rebased series on recent pavel/for-next
- split up arm dts patch by arm sub arch (suggested by Krzysztof Kozlowski)
- added multiple Reviewed-by tags
- slightly reworded commit messages (suggested by Krzysztof Kozlowski)
- added actual dtbs_check warnings to commit messages
- added Russell King to Cc for binding conversion patch (because license)

v6:
- rebased series on recent pavel/for-next
- added Reviewed-by from Marek to patch 1
- patch 2 from v5 was picked by Pavel and is already in his for-next
  branch
- previous patch 3/3 (now 2/7) was reworked based on feedback by Rob
- added more dt patches fixing warnings after binding conversion to yaml

v5:
- replaced patch 1/3 by a new patch removing platform_data support for
  the leds-pwm driver
- little rewording of commit message in patch 2/3
- updated patch 3/3 based on feedback by Rob Herring
- added Marek Behún to Cc, because he also works on removing
  platform_data support
- rebased series on pavel/for-next

v4:
- added led-class patch handling fwnode passing differently (patch 1/3)
- adapted leds-pwm patch to new led-class (patch 2/3)
- contacted original author of leds-pwm dt binding on license issue
  (patch 3/3)

v3:
- series rebased on v5.9-rc4
- changed license of .yaml file to recommended one (patch 2/2)
- added Acked-by to both patches

v2:
- series rebased on v5.9-rc3
- added the dt-bindings update patch (2/2)

v1:
- based on v5.9-rc2
- backport on v5.4.59 tested and working

Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-amlogic@lists.infradead.org
Cc: linux-mips@vger.kernel.org


Alexander Dahl (5):
  dt-bindings: mfd: Fix schema warnings for pwm-leds
  ARM: dts: berlin: Fix schema warnings for pwm-leds
  ARM: dts: stm32: Fix schema warnings for pwm-leds
  arm64: dts: meson: Fix schema warnings for pwm-leds
  MIPS: DTS: img: Fix schema warnings for pwm-leds

 Documentation/devicetree/bindings/mfd/iqs62x.yaml   |  5 +++--
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts   |  6 +++---
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts           | 13 +++++++------
 .../boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts |  4 ++--
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts      |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts    |  8 ++++----
 arch/mips/boot/dts/img/pistachio_marduk.dts         |  5 +++--
 7 files changed, 24 insertions(+), 21 deletions(-)


base-commit: 98650b0874171cc443251f7b369d3b1544db9d4e
-- 
2.20.1

