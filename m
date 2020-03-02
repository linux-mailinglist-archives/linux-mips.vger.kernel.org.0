Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D770175D9E
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 15:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgCBOyD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 09:54:03 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56819 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbgCBOyD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 09:54:03 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200302145400euoutp02ef2f1f5934fe610c4e95bd79a85a61c5~4hGWa5gaX1256612566euoutp02B
        for <linux-mips@vger.kernel.org>; Mon,  2 Mar 2020 14:54:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200302145400euoutp02ef2f1f5934fe610c4e95bd79a85a61c5~4hGWa5gaX1256612566euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583160840;
        bh=1YpBDdUSj9Tutu65M9yYPLwIeiCBzQByBPG3bXUqKY4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=XQekw8sfKybOYgQC9ih5kcxAQgSrNO31iRcSCH5XaG2VW3c0YtT4zC7Dpd5n12vim
         zRN+naodv8kYLHuuwNiCuYqXICTKIK0hfsKsW2OmW0/M9ed9ejbABQFO/HPN7ijF5b
         UE+TCrorV90nv4HOdllr6JSlhW95IS/L/t8/yZVA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200302145400eucas1p27f063bda85698a26b9d40051649fd22f~4hGWBTIDR2039220392eucas1p20;
        Mon,  2 Mar 2020 14:54:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 96.46.61286.80E1D5E5; Mon,  2
        Mar 2020 14:54:00 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200302145400eucas1p27779f8a73135d47fb5818994550c7b95~4hGVqQ5Fi1653316533eucas1p2G;
        Mon,  2 Mar 2020 14:54:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200302145400eusmtrp1fae3b2bcb60e0fabfc651cacdac0b518~4hGVpez122816728167eusmtrp1h;
        Mon,  2 Mar 2020 14:54:00 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-6b-5e5d1e081bb3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 89.09.07950.80E1D5E5; Mon,  2
        Mar 2020 14:54:00 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200302145359eusmtip1dbbc18d93b300458c81e7d2b8ca625c8~4hGVP6H3y2510725107eusmtip1w;
        Mon,  2 Mar 2020 14:53:59 +0000 (GMT)
Subject: Re: [PATCH 3/3] docs: mips: remove no longer needed au1xxx_ide.rst
 documentation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <a3c6522f-ab0e-8212-a049-a31286b36ad7@samsung.com>
Date:   Mon, 2 Mar 2020 15:53:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200116122938.20789-4-b.zolnierkie@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e3eXe+kyXVaO/iqphRZ+SDBi4mYJIygEJJYidbMi0puyqam
        qbHQnE5bqYU4hTTztdDGMDU1lGUzETOMIu3hoxX5BKeCmlnOm+R/3/M9n/P7ngM/EhO0c13I
        RHkqo5BLk0SEPd5mXhs+TnpEx/j9WnelLb1qRFcN5+F0yWsrTtfkP8Zpc8cUh37XWUXQhcZn
        iNbOmjF6pNsrlCdubRrliI36QkL8qqmZI67VlnHFs32TuHjJ6BFBXLIPjmOSEtMZhW/IFfuE
        0sEhLKX3WMYT9RdChbo8NYhHAhUA63UVSIPsSQHViKDlva3gbRXLCOZUR9nGEoK8pj58Z2I6
        txhjoQYEwzXuLDSPQL1p2IacqChYNuZzNYgknSkvmCm8YGMwqogDo0UmwsYQVBCUqPXbaXwq
        BFY7i7Z9fIs3rt23s+m9lASsEy+5LOMIAxUW3PYmb4s3lgbZbIwSwpjlIYfV+6F9vgqzZQFl
        toOVxjyMXfo0WJZWuax2gpn+VjtWu8FgWTHODrQg+F3w8990O4KGsk2CpU7C5zfrhC0Zo47A
        005f1j4FNR/ubC8ElAN8nHdkl3CA0rZyjLX5UJAvYOlDYKg3EDuxmudN2D0k0u26TLfrHN2u
        c3T/c6sRrkdCJk0pi2eU/nLmuo9SKlOmyeN9ribLjGjrOw1u9ls70MpIrAlRJBLt4Udg0TEC
        rjRdmSkzISAxkTP/LC8qRsCPk2beYBTJlxVpSYzShFxJXCTkn3g0HS2g4qWpzDWGSWEUO10O
        yXNRIYesntAAw2Jlo7tl0c3w/dz4pwNdlbkLXuJ9gWE5Ev1Nf5dmdXhOOPH1cIZ2irr4Yy5b
        8e1Wck/1mDlyY2JhPGLB15DVDd3tFn4go1dFPvAUbhwMW5VQ4mnv8y/erk3WD9XG+vUvplon
        zdrl4Lt1f8pBYQZT65nsAUli2u16Ea5MkPp7Ywql9C/RZTY/SgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7occrFxBo3zWSyeHGhntJhzvoXF
        YuKJTywWC9uWsFgc2/GIyeLyrjlsFp2btjJa9L0+xmxxaY+KA6fHlpU3mTw2repk8zi6ci2T
        x+K+yawer488ZPH4vEkugC1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnf
        ziYlNSezLLVI3y5BL2PS6bPMBQd0Kla332VrYNyt3MXIySEhYCLxsrmHuYuRi0NIYCmjxJy7
        TaxdjBxACRmJ4+vLIGqEJf5c62KDqHnNKPF4/j4WkISwQLTEl01tYPUiAioSrzrDQGqYBXqZ
        JP69nskK0XCUUaLx6HNmkAY2ASuJie2rGEFsXgE7iR+7utlAbBag5k0/p7CD2KICERKHd8yC
        qhGUODnzCQvIAk6g+k2TrEDCzALqEn/mXWKGsMUlbj2ZzwRhy0tsfzuHeQKj0Cwk3bOQtMxC
        0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgfG47djPLTsYu94FH2IU4GBU4uH9
        wRAbJ8SaWFZcmXuIUYKDWUmE15czOk6INyWxsiq1KD++qDQntfgQoynQbxOZpUST84GpIq8k
        3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6Prxmv+C83XTlKZ+ytr
        7yf+nJmb80ST9c6lRc+q+XOJ8VzKY+ttKpZ8uvsy9stO1X/Qsl7YUfRI4TFxvm0OuaGvznww
        lYyWyRE+ZSsnfLrRUljR/+WmQ1x/1aT4qy2ZZ4ceztnxX/+og+Zagfh51nPc93CGTGln+D3/
        G1fmLEmWLDOLiY3TS5RYijMSDbWYi4oTAYPFi4/dAgAA
X-CMS-MailID: 20200302145400eucas1p27779f8a73135d47fb5818994550c7b95
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200116122952eucas1p2060adca6613ae02096ecc80319e5d197
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116122952eucas1p2060adca6613ae02096ecc80319e5d197
References: <20200116122938.20789-1-b.zolnierkie@samsung.com>
        <CGME20200116122952eucas1p2060adca6613ae02096ecc80319e5d197@eucas1p2.samsung.com>
        <20200116122938.20789-4-b.zolnierkie@samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Hi Jonathan,

Gentle ping.

Can we get your ACK to merge this patch through MIPS (or IDE) tree?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

On 1/16/20 1:29 PM, Bartlomiej Zolnierkiewicz wrote:
> Since the au1xxx-ide IDE host driver is no longer needed its documentation
> can be removed.
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  Documentation/mips/au1xxx_ide.rst | 130 ------------------------------
>  Documentation/mips/index.rst      |   2 -
>  2 files changed, 132 deletions(-)
>  delete mode 100644 Documentation/mips/au1xxx_ide.rst
> 
> diff --git a/Documentation/mips/au1xxx_ide.rst b/Documentation/mips/au1xxx_ide.rst
> deleted file mode 100644
> index 2f9c2cff6738..000000000000
> --- a/Documentation/mips/au1xxx_ide.rst
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -.. include:: <isonum.txt>
> -
> -======================
> -MIPS AU1XXX IDE driver
> -======================
> -
> -Released 2005-07-15
> -
> -About
> -=====
> -
> -This file describes the 'drivers/ide/au1xxx-ide.c', related files and the
> -services they provide.
> -
> -If you are short in patience and just want to know how to add your hard disc to
> -the white or black list, go to the 'ADD NEW HARD DISC TO WHITE OR BLACK LIST'
> -section.
> -
> -
> -License
> -=======
> -
> -:Copyright: |copy| 2003-2005 AMD, Personal Connectivity Solutions
> -
> -This program is free software; you can redistribute it and/or modify it under
> -the terms of the GNU General Public License as published by the Free Software
> -Foundation; either version 2 of the License, or (at your option) any later
> -version.
> -
> -THIS SOFTWARE IS PROVIDED ``AS IS`` AND ANY EXPRESS OR IMPLIED WARRANTIES,
> -INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> -FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
> -BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> -CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> -SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> -INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> -CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> -ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> -POSSIBILITY OF SUCH DAMAGE.
> -
> -You should have received a copy of the GNU General Public License along with
> -this program; if not, write to the Free Software Foundation, Inc.,
> -675 Mass Ave, Cambridge, MA 02139, USA.
> -
> -Note:
> -      for more information, please refer "AMD Alchemy Au1200/Au1550 IDE
> -      Interface and Linux Device Driver" Application Note.
> -
> -
> -Files, Configs and Compatibility
> -================================
> -
> -Two files are introduced:
> -
> -  a) 'arch/mips/include/asm/mach-au1x00/au1xxx_ide.h'
> -     contains : struct _auide_hwif
> -
> -                - timing parameters for PIO mode 0/1/2/3/4
> -                - timing parameters for MWDMA 0/1/2
> -
> -  b) 'drivers/ide/mips/au1xxx-ide.c'
> -     contains the functionality of the AU1XXX IDE driver
> -
> -Following extra configs variables are introduced:
> -
> -  CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA
> -	- enable the PIO+DBDMA mode
> -  CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA
> -	- enable the MWDMA mode
> -
> -
> -Supported IDE Modes
> -===================
> -
> -The AU1XXX IDE driver supported all PIO modes - PIO mode 0/1/2/3/4 - and all
> -MWDMA modes - MWDMA 0/1/2 -. There is no support for SWDMA and UDMA mode.
> -
> -To change the PIO mode use the program hdparm with option -p, e.g.
> -'hdparm -p0 [device]' for PIO mode 0. To enable the MWDMA mode use the option
> --X, e.g. 'hdparm -X32 [device]' for MWDMA mode 0.
> -
> -
> -Performance Configurations
> -==========================
> -
> -If the used system doesn't need USB support enable the following kernel
> -configs::
> -
> -    CONFIG_IDE=y
> -    CONFIG_BLK_DEV_IDE=y
> -    CONFIG_IDE_GENERIC=y
> -    CONFIG_BLK_DEV_IDEPCI=y
> -    CONFIG_BLK_DEV_GENERIC=y
> -    CONFIG_BLK_DEV_IDEDMA_PCI=y
> -    CONFIG_BLK_DEV_IDE_AU1XXX=y
> -    CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA=y
> -    CONFIG_BLK_DEV_IDEDMA=y
> -
> -Also define 'IDE_AU1XXX_BURSTMODE' in 'drivers/ide/mips/au1xxx-ide.c' to enable
> -the burst support on DBDMA controller.
> -
> -If the used system need the USB support enable the following kernel configs for
> -high IDE to USB throughput.
> -
> -::
> -
> -    CONFIG_IDE_GENERIC=y
> -    CONFIG_BLK_DEV_IDEPCI=y
> -    CONFIG_BLK_DEV_GENERIC=y
> -    CONFIG_BLK_DEV_IDEDMA_PCI=y
> -    CONFIG_BLK_DEV_IDE_AU1XXX=y
> -    CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA=y
> -    CONFIG_BLK_DEV_IDEDMA=y
> -
> -Also undefine 'IDE_AU1XXX_BURSTMODE' in 'drivers/ide/mips/au1xxx-ide.c' to
> -disable the burst support on DBDMA controller.
> -
> -
> -Acknowledgments
> -===============
> -
> -These drivers wouldn't have been done without the base of kernel 2.4.x AU1XXX
> -IDE driver from AMD.
> -
> -Additional input also from:
> -Matthias Lenk <matthias.lenk@amd.com>
> -
> -Happy hacking!
> -
> -Enrico Walther <enrico.walther@amd.com>
> diff --git a/Documentation/mips/index.rst b/Documentation/mips/index.rst
> index a93c2f65884c..d5ad8c00f0bd 100644
> --- a/Documentation/mips/index.rst
> +++ b/Documentation/mips/index.rst
> @@ -10,8 +10,6 @@ MIPS-specific Documentation
>  
>     ingenic-tcu
>  
> -   au1xxx_ide
> -
>  .. only::  subproject and html
>  
>     Indices
> 
