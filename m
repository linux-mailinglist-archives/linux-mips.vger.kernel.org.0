Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57C7A13DA06
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 13:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgAPM34 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 07:29:56 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38121 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgAPM34 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 07:29:56 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200116122953euoutp028670d8f4abb9fbb35506a9fbe9ca41aa~qXdYsx-K30644006440euoutp02f
        for <linux-mips@vger.kernel.org>; Thu, 16 Jan 2020 12:29:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200116122953euoutp028670d8f4abb9fbb35506a9fbe9ca41aa~qXdYsx-K30644006440euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1579177793;
        bh=v970nJMjsRWqcBPklydlZ7zPDTbaWjPdtn6Ae0h/7OQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lLJC5hZSytGpSpw9ReEM8OjhihJdodbQcnHBJ/ATcP2vSors3nQzglOx4PNhtxUWb
         U5SJWPOOWsMQdYSusLzLI6Z/sHrlm1gnbSqjnTmZlOCEody/LMsZGPKPpJntt1R4mq
         6GpPBMQ61otfm3T4yPU1k07jM19Sisw2dIOPSVm8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200116122953eucas1p241a67f127bd32a308a32478d5d2d5b70~qXdYafozZ2394123941eucas1p2J;
        Thu, 16 Jan 2020 12:29:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id B5.7E.60679.147502E5; Thu, 16
        Jan 2020 12:29:53 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200116122952eucas1p2060adca6613ae02096ecc80319e5d197~qXdX300GS2194221942eucas1p2a;
        Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200116122952eusmtrp21ef87d1f6f590cad08fc8a76f99ac2c8~qXdX3Qom_1149911499eusmtrp2O;
        Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-9d-5e2057419fa8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E4.32.08375.047502E5; Thu, 16
        Jan 2020 12:29:52 +0000 (GMT)
Received: from AMDC3058.digital.local (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200116122952eusmtip11ca6991f0150900a555f601adf878ed6~qXdXTA-K60627006270eusmtip1c;
        Thu, 16 Jan 2020 12:29:52 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-ide@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com
Subject: [PATCH 3/3] docs: mips: remove no longer needed au1xxx_ide.rst
 documentation
Date:   Thu, 16 Jan 2020 13:29:38 +0100
Message-Id: <20200116122938.20789-4-b.zolnierkie@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116122938.20789-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87qO4QpxBp//iFtsnLGe1eLJgXZG
        iznnW1gsJp74xGKxsG0Ji8WxHY+YLC7vmsNm0blpK6NF3+tjzBaX9qg4cHlsWXmTyWPTqk42
        j6Mr1zJ5LO6bzOrx+shDFo++LasYPT5vkgtgj+KySUnNySxLLdK3S+DKmDj/N2tBr0ZFz94l
        zA2MNxS6GDk5JARMJL6+/M7excjFISSwglHi3KNdrBDOF0aJ+ZcPsUA4nxklHjQvYYVpuXt5
        D1RiOaPEjAWrGeFaJt1oYQKpYhOwkpjYvgosISKwm1Hi5/PdzCAOs8AERol9ZyYwg1QJC4RL
        rFl3hw3EZhFQldixrhvM5hWwlTi/6T87xD55ia3fPoHt5hSwk+g78IwVokZQ4uTMJywgNjNQ
        TfPW2WALJAR2sUu8XnucEaLZRWLi9p1sELawxKvjW6CGykj83zmfCaJhHaPE344XUN3bGSWW
        T/4H1WEtcefcLyCbA2iFpsT6XfoQYUeJhdd6WUDCEgJ8EjfeCkIcwScxadt0Zogwr0RHmxBE
        tZrEhmUb2GDWdu1cyQxhe0hsfXqZeQKj4iwk78xC8s4shL0LGJlXMYqnlhbnpqcWG+WllusV
        J+YWl+al6yXn525iBKao0/+Of9nBuOtP0iFGAQ5GJR7eGUEKcUKsiWXFlbmHGCU4mJVEeE/O
        kI0T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6YklqdmpqQWoRTJaJg1OqgbFNoq3X
        7t2cadt2Rje5iegV9XSduKVinr9h+yWG6zOifR0mv94evK6k7Z2Z4V1Lrp/T/e4kzvCaeH9/
        wzSmB1viLW3+bO7/Jm5d4HUxly9pt27PvMItuvv03n2pEORg1z79VZ9d1yVysuftX6rvol83
        +AvVhdQcmJBXJ/J2srKywZ7JzJF2UUosxRmJhlrMRcWJAMk+ldlNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7oO4QpxBuc2m1hsnLGe1eLJgXZG
        iznnW1gsJp74xGKxsG0Ji8WxHY+YLC7vmsNm0blpK6NF3+tjzBaX9qg4cHlsWXmTyWPTqk42
        j6Mr1zJ5LO6bzOrx+shDFo++LasYPT5vkgtgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx
        1DM0No+1MjJV0rezSUnNySxLLdK3S9DLmDj/N2tBr0ZFz94lzA2MNxS6GDk5JARMJO5e3sPS
        xcjFISSwlFHia9cFIIcDKCEjcXx9GUSNsMSfa11sEDWfGCUOfFvLDpJgE7CSmNi+ihEkISKw
        n1Fi8sIDTCAOs8AURokVZ1qZQCYJC4RKvLmsBNLAIqAqsWNdNxuIzStgK3F+0392iA3yElu/
        fWIFsTkF7CT6DjwDs4WAaube2s0KUS8ocXLmExYQmxmovnnrbOYJjAKzkKRmIUktYGRaxSiS
        Wlqcm55bbKhXnJhbXJqXrpecn7uJERhF24793LyD8dLG4EOMAhyMSjy8M4IU4oRYE8uKK3MP
        MUpwMCuJ8J6cIRsnxJuSWFmVWpQfX1Sak1p8iNEU6ImJzFKiyfnACM8riTc0NTS3sDQ0NzY3
        NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cAYfuylFeORr3M9NsvO2PPwj4/ln8eLXAsS
        XApztLrn9K1eLb/+y1wdgZOXTRclzf7t5GK09N7GnNXT6o02P1/X+l/vmaNkyfoNx6TUb+db
        nC3V4E+Lt3gm4/fy+4pVAXnxr0Md98iXr4+9KxL8PSfinPhOt5gWi9SWfQEhH1PumcX5vIl8
        v2ynEktxRqKhFnNRcSIAAWOZL7gCAAA=
X-CMS-MailID: 20200116122952eucas1p2060adca6613ae02096ecc80319e5d197
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200116122952eucas1p2060adca6613ae02096ecc80319e5d197
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116122952eucas1p2060adca6613ae02096ecc80319e5d197
References: <20200116122938.20789-1-b.zolnierkie@samsung.com>
        <CGME20200116122952eucas1p2060adca6613ae02096ecc80319e5d197@eucas1p2.samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since the au1xxx-ide IDE host driver is no longer needed its documentation
can be removed.

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

