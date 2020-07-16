Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E572A222027
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbgGPKCF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:02:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:38196 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725996AbgGPKCE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:02:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iA-0008Mc-02; Thu, 16 Jul 2020 12:01:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4D421C080E; Thu, 16 Jul 2020 11:51:54 +0200 (CEST)
Date:   Thu, 16 Jul 2020 11:51:54 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        paulburton@kernel.org, paul@crapouillou.net, ak@linux.intel.com,
        ebiederm@xmission.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH v4 0/5] Add support for Ingenic X1830 SoC and Y&A
 CU1830-Neo board.
Message-ID: <20200716095154.GC8455@alpha.franken.de>
References: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 14, 2020 at 01:32:24PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> v3->v4:
> 1.Modify the commit message and add the change description
>   for CU1000-Neo in patch [2/5].
> 2.The wrongly written "ingenic,x1000" in compatible is
>   changed to "ingenic,x1000e" in "cu1000-neo.dts".
> 3.Adjust the order of nodes according to the corresponding
>   address value for X1000.
> 4.Drop unnecessary node in "wlan_pwrseq" in "cu1000-neo.dts".
> 5.Add the leds node to "cu1000-neo.dts".
> 
> 周琰杰 (Zhou Yanjie) (5):
>   MIPS: Ingenic: Add Ingenic X1830 support.
>   dt-bindings: MIPS: Add X1830 based CU1830-Neo and fix bug in
>     CU1000-Neo.
>   MIPS: Ingenic: Add YSH & ATIL CU Neo board support.
>   MIPS: Ingenic: Fix bugs and add missing LED node for X1000.
>   MIPS: CU1000-Neo: Refresh defconfig to support LED.
> 
>  .../devicetree/bindings/mips/ingenic/devices.yaml  |  12 +-
>  arch/mips/boot/dts/ingenic/Makefile                |   1 +
>  arch/mips/boot/dts/ingenic/cu1000-neo.dts          | 114 ++++----
>  arch/mips/boot/dts/ingenic/cu1830-neo.dts          | 168 ++++++++++++
>  arch/mips/boot/dts/ingenic/x1000.dtsi              | 126 +++++----
>  arch/mips/boot/dts/ingenic/x1830.dtsi              | 300 +++++++++++++++++++++
>  arch/mips/configs/cu1000-neo_defconfig             |   4 +
>  arch/mips/configs/cu1830-neo_defconfig             | 123 +++++++++
>  arch/mips/jz4740/Kconfig                           |  10 +
>  9 files changed, 733 insertions(+), 125 deletions(-)
>  create mode 100644 arch/mips/boot/dts/ingenic/cu1830-neo.dts
>  create mode 100644 arch/mips/boot/dts/ingenic/x1830.dtsi
>  create mode 100644 arch/mips/configs/cu1830-neo_defconfig

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
