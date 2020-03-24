Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C326190C26
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 12:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgCXLOq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 07:14:46 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43136 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbgCXLOn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 07:14:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200324111440euoutp01a2176d57fc0f6de94d9d93869a4a31af~-OTHe3EOt0298002980euoutp01O
        for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2020 11:14:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200324111440euoutp01a2176d57fc0f6de94d9d93869a4a31af~-OTHe3EOt0298002980euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585048480;
        bh=HC92hbHB4NGqYkPZ4aXE02GdPjHLAUV0nlXwgx6RQZo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YvmoiBWFWykGSHyEa0KH4uCU6ZrKpGIalUFmhAQYskR7vcv0Y/Sth1Nh0NWdwMFvR
         mFK/cOXE/j47yS+8HEFm1dgZF9u6IQpgJndsny3G7jj/XzKXPNuLiIZ92MqtZYnsBg
         7y0skiv9KGxzRCVwe6et3RLdWvpocsDC3fLRd6jo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200324111439eucas1p21631711698dc6768828e415bbb2d469f~-OTHJyAuI0228102281eucas1p2y;
        Tue, 24 Mar 2020 11:14:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E7.60.60679.F9BE97E5; Tue, 24
        Mar 2020 11:14:39 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200324111439eucas1p1d0e34bd0563643bce53f060490772075~-OTGnNaKD2380323803eucas1p1Q;
        Tue, 24 Mar 2020 11:14:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200324111439eusmtrp1e3684ba0109e679d2fed3e9fcde49889~-OTGmegks2210322103eusmtrp1e;
        Tue, 24 Mar 2020 11:14:39 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-12-5e79eb9ffe9b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 54.6F.08375.F9BE97E5; Tue, 24
        Mar 2020 11:14:39 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200324111438eusmtip192e38a4eb7b2bb65871a9d021311ae88~-OTGDeXfh0076200762eusmtip12;
        Tue, 24 Mar 2020 11:14:38 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Christoph Hellwig <hch@lst.de>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com
Subject: [PATCH v2 3/3] docs: mips: remove no longer needed au1xxx_ide.rst
 documentation
Date:   Tue, 24 Mar 2020 12:14:20 +0100
Message-Id: <20200324111420.31793-4-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200324111420.31793-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTcRTnv3t3d11tXafgoaJypaiUlvbh0gsF0wv1oaQXQtbU66zcsl1n
        Gn2whzothjqzmpb5SjfJx3xOpXSVJlZWq7CoIJOwRhE5pCSjXa+S337nnN/jHDgkpnguXk4e
        02awOq0qTUlI8c7B3083VLqyEzbWjIbTrdeaxfREfz6iK0Yv4rSl8aGILn70E6er8mpxerB7
        XEQ7eyoIusDWgejX7nEJbXQNYvSLvnX0/fMDWKSMyX1RjzPtljcixm5+L2Fs1gKCeWi5I2J6
        3+QQTI3RJGZcDz7ijLHdipgp26o90njptmQ27VgmqwvbcVSa+tZAp08GZf3qsqMcZPEvRCQJ
        1GY4b1pWiKSkgmpA4Gy0S4TCjSC/MhcTiilPUTomWlDMTGiEfj2Cuq4rHoWXoOi3ZfCYoLZA
        cb4V8diXioDmjl4xL8CoUgy6Ht/E+YEPFQ+1FU/mxDgVAA5jq4jHMmo7nLvbR/AYqNXQMf1T
        zGMvage0DTUhgeMNw9cn5nwwD+dCR/ncpkCNS8DRaBALm0aD/Uai4OMDX4faJQJeCSOmy7jA
        b0Iwa5icF3chqDf9nU/eCu+ezhC8EUYFQ3NPmNCOgpkWNxL85TD2zVvYQQ4lnVcxoS0DQ55C
        YAdCy+0WYiG20G6ZpzAw+mNXEfI3LzrGvOgY8//YWwizIj9Wz2nULBeuZU+HcioNp9eqQ5NO
        amzI82gjf4fc3ajnT6IDUSRSLpUFfcxOUIhVmVy2xoGAxJS+sjY2K0EhS1Zln2F1J4/o9Gks
        50ArSFzpJ4uo/nJYQalVGewJlk1ndQtTEem1PAeFz0bm77yUGXnoljM2dl9ZWQhF1UynBLiK
        HqQVmz6d/nAq6Vxla0w5ik32Czsek7Tk1eNAQyKs/947ozbsi3GW7x4OjvsRIg8vjyZOVX/e
        HyLfc9Cpf882kL6QEuV2xU7FHTAPzE4X+Zi2WceeTdSVrBnVrrr3smrt2apHe4tstBLnUlWb
        QjAdp/oH+ut/BWQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xu7rzX1fGGezp5bXYOGM9q8WTA+2M
        FnPOt7BYrFx9lMli4olPLBYL25awWBzb8YjJ4vKuOWwWnZu2Mlpc+/KI3aLv9TFmi0t7VCwO
        Nx1kduD1aL20nMVjy8qbTB47Z91l99i0qpPN4+jKtUweu282sHks7pvM6vH6yEMWj74tqxg9
        Pm+SC+CK0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL
        0Mu41WFR8EKj4sf2nYwNjCsVuxg5OCQETCR+PcntYuTiEBJYyiixf8p9Zoi4jMTx9WVdjJxA
        prDEn2tdbBA1nxglHl24xwSSYBOwkpjYvooRxBYRMJZYv3U3K0gRs8A8ZokbLy6DFQkLREjc
        62kAs1kEVCUO9W0Es3kFbCUa9+1hg9ggL7H12ydWEJtTwE5i8/F1YEOFgGpeffrMDlEvKHFy
        5hMWEJsZqL5562zmCYwCs5CkZiFJLWBkWsUoklpanJueW2yoV5yYW1yal66XnJ+7iREYfduO
        /dy8g/HSxuBDjAIcjEo8vBoPK+OEWBPLiitzDzFKcDArifBuTq2IE+JNSaysSi3Kjy8qzUkt
        PsRoCvTERGYp0eR8YGLIK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TB
        KdXAaBHgdbdn455tDx3vaK9v3X+s+4x/80Ux7k1zlx33+vTfKDM/4sLel5Y569hnnr+swtvt
        83XX7b09MmxVR27M7ll+7RPzxpLulPuzhdW43LLP9P/4kd6z6eLvqcs7eqdv+SIz14nN9bbn
        SqcJ9uwFQXvn9pY+r7vPZzr7f2Jsus0L5/0nHkrnuiuxFGckGmoxFxUnAgC8dPGE1AIAAA==
X-CMS-MailID: 20200324111439eucas1p1d0e34bd0563643bce53f060490772075
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200324111439eucas1p1d0e34bd0563643bce53f060490772075
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324111439eucas1p1d0e34bd0563643bce53f060490772075
References: <20200324111420.31793-1-b.zolnierkie@samsung.com>
        <CGME20200324111439eucas1p1d0e34bd0563643bce53f060490772075@eucas1p1.samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since the au1xxx-ide IDE host driver is no longer needed its documentation
can be removed.

Acked-by: Manuel Lauss <manuel.lauss@gmail.com>
Acked-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 Documentation/mips/au1xxx_ide.rst | 130 ------------------------------
 Documentation/mips/index.rst      |   2 -
 2 files changed, 132 deletions(-)
 delete mode 100644 Documentation/mips/au1xxx_ide.rst

diff --git a/Documentation/mips/au1xxx_ide.rst b/Documentation/mips/au1xxx_ide.rst
deleted file mode 100644
index 2f9c2cff6738..000000000000
--- a/Documentation/mips/au1xxx_ide.rst
+++ /dev/null
@@ -1,130 +0,0 @@
-.. include:: <isonum.txt>
-
-======================
-MIPS AU1XXX IDE driver
-======================
-
-Released 2005-07-15
-
-About
-=====
-
-This file describes the 'drivers/ide/au1xxx-ide.c', related files and the
-services they provide.
-
-If you are short in patience and just want to know how to add your hard disc to
-the white or black list, go to the 'ADD NEW HARD DISC TO WHITE OR BLACK LIST'
-section.
-
-
-License
-=======
-
-:Copyright: |copy| 2003-2005 AMD, Personal Connectivity Solutions
-
-This program is free software; you can redistribute it and/or modify it under
-the terms of the GNU General Public License as published by the Free Software
-Foundation; either version 2 of the License, or (at your option) any later
-version.
-
-THIS SOFTWARE IS PROVIDED ``AS IS`` AND ANY EXPRESS OR IMPLIED WARRANTIES,
-INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
-FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
-BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-POSSIBILITY OF SUCH DAMAGE.
-
-You should have received a copy of the GNU General Public License along with
-this program; if not, write to the Free Software Foundation, Inc.,
-675 Mass Ave, Cambridge, MA 02139, USA.
-
-Note:
-      for more information, please refer "AMD Alchemy Au1200/Au1550 IDE
-      Interface and Linux Device Driver" Application Note.
-
-
-Files, Configs and Compatibility
-================================
-
-Two files are introduced:
-
-  a) 'arch/mips/include/asm/mach-au1x00/au1xxx_ide.h'
-     contains : struct _auide_hwif
-
-                - timing parameters for PIO mode 0/1/2/3/4
-                - timing parameters for MWDMA 0/1/2
-
-  b) 'drivers/ide/mips/au1xxx-ide.c'
-     contains the functionality of the AU1XXX IDE driver
-
-Following extra configs variables are introduced:
-
-  CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA
-	- enable the PIO+DBDMA mode
-  CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
-	- enable the MWDMA mode
-
-
-Supported IDE Modes
-===================
-
-The AU1XXX IDE driver supported all PIO modes - PIO mode 0/1/2/3/4 - and all
-MWDMA modes - MWDMA 0/1/2 -. There is no support for SWDMA and UDMA mode.
-
-To change the PIO mode use the program hdparm with option -p, e.g.
-'hdparm -p0 [device]' for PIO mode 0. To enable the MWDMA mode use the option
--X, e.g. 'hdparm -X32 [device]' for MWDMA mode 0.
-
-
-Performance Configurations
-==========================
-
-If the used system doesn't need USB support enable the following kernel
-configs::
-
-    CONFIG_IDE=y
-    CONFIG_BLK_DEV_IDE=y
-    CONFIG_IDE_GENERIC=y
-    CONFIG_BLK_DEV_IDEPCI=y
-    CONFIG_BLK_DEV_GENERIC=y
-    CONFIG_BLK_DEV_IDEDMA_PCI=y
-    CONFIG_BLK_DEV_IDE_AU1XXX=y
-    CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA=y
-    CONFIG_BLK_DEV_IDEDMA=y
-
-Also define 'IDE_AU1XXX_BURSTMODE' in 'drivers/ide/mips/au1xxx-ide.c' to enable
-the burst support on DBDMA controller.
-
-If the used system need the USB support enable the following kernel configs for
-high IDE to USB throughput.
-
-::
-
-    CONFIG_IDE_GENERIC=y
-    CONFIG_BLK_DEV_IDEPCI=y
-    CONFIG_BLK_DEV_GENERIC=y
-    CONFIG_BLK_DEV_IDEDMA_PCI=y
-    CONFIG_BLK_DEV_IDE_AU1XXX=y
-    CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA=y
-    CONFIG_BLK_DEV_IDEDMA=y
-
-Also undefine 'IDE_AU1XXX_BURSTMODE' in 'drivers/ide/mips/au1xxx-ide.c' to
-disable the burst support on DBDMA controller.
-
-
-Acknowledgments
-===============
-
-These drivers wouldn't have been done without the base of kernel 2.4.x AU1XXX
-IDE driver from AMD.
-
-Additional input also from:
-Matthias Lenk <matthias.lenk@amd.com>
-
-Happy hacking!
-
-Enrico Walther <enrico.walther@amd.com>
diff --git a/Documentation/mips/index.rst b/Documentation/mips/index.rst
index a93c2f65884c..d5ad8c00f0bd 100644
--- a/Documentation/mips/index.rst
+++ b/Documentation/mips/index.rst
@@ -10,8 +10,6 @@ MIPS-specific Documentation
 
    ingenic-tcu
 
-   au1xxx_ide
-
 .. only::  subproject and html
 
    Indices
-- 
2.24.1

