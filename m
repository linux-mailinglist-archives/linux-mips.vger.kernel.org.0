Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 838A99A59D
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2019 04:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390256AbfHWCgz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Aug 2019 22:36:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56412 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389643AbfHWCgz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Aug 2019 22:36:55 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7N2aJ1u068638;
        Thu, 22 Aug 2019 21:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566527779;
        bh=nkExP0eRbsPB/OWk2fAwZsppRHsUY3F2k8vm2ySuYXE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=n78gSZca5zRUaYh6aN1w/zueFQG3RgizaqRouQ+tXSV380/ZMho4iz27VBE4XBGXe
         BaeEw45AKwRpJWWodv4To3aNKs8fLmy+7/9fbjNWs+761/erIceZIfOKoJtspcscqn
         HvdJm3durOh7tJF14fmnvYItUCmQSnOUAdEvY4Uw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7N2aIBV090688
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 22 Aug 2019 21:36:19 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 22
 Aug 2019 21:36:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 22 Aug 2019 21:36:18 -0500
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7N2aEJw039712;
        Thu, 22 Aug 2019 21:36:15 -0500
Subject: Re: [PATCH v3 0/4] Lantiq VRX200/ARX300 PCIe PHY driver
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <john@phrozen.org>, <paul.burton@mips.com>, <ralf@linux-mips.org>
CC:     <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <hauke@hauke-m.de>, <mark.rutland@arm.com>, <ms@dev.tdt.de>
References: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <1d5212e1-aeb4-1f05-d5d4-6b944cf328cc@ti.com>
Date:   Fri, 23 Aug 2019 08:06:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 27/07/19 5:34 PM, Martin Blumenstingl wrote:
> Various Lantiq (now Intel) SoCs contain one or more PCIe controllers
> and PHYs.
> This adds a driver for the PCIe PHYs found on the Lantiq VRX200 and
> ARX300 SoCs. GRX390 should also be supported as far as I can tell,
> but I don't have any of these devices to further verify that.
> 
> I have tested this PCIe PHY driver with the out-of-tree PCIe controller
> driver in OpenWrt: [0]
> 
> dependencies for this series:
> none
> 
> patches 1-3 should go through the PHY tree

merged the phy patches.

Thanks
Kishon
> patch 4 should go through the mips tree
> 
> I am aware that this series is too late for the v5.3 development cycle.
> Getting review comments is still appreciated so this can be queued early
> in the v5.4 development cycle.
> 
> 
> Changes since v2 at [2]:
> - added Rob's Reviewed-by to the dt-bindings patch (thank you!)
> 
> Changes since v1 at [1]:
> - many thanks to Rob for giving me many hints regarding the .yaml bindings!
> - update the .yaml binding license to (GPL-2.0-only OR BSD-2-Clause)
> - changed the property lantiq,rcu to type phandle
> - add the optional big-endian and little-endian boolean properties
> - use numeric values for the clock phandles in the example to make the
>   dt_binding_check build happy
> - replaced two mdelay(1); with usleep_range(1000, 2000); in patch #2
>   (spotted and reported by Hauke off-list)
> 
> 
> [0] https://github.com/xdarklight/openwrt/commits/lantiq-mainline-pcie-phy-20190702
> [1] https://patchwork.kernel.org/cover/11028797/
> [2] https://patchwork.kernel.org/cover/11031421/
> 
> 
> Martin Blumenstingl (4):
>   dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe
>     PHYs
>   phy: lantiq: vrx200-pcie: add a driver for the Lantiq VRX200 PCIe PHY
>   phy: enable compile-testing for the Lantiq PHY drivers
>   MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver
> 
>  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  |  95 ++++
>  arch/mips/lantiq/xway/sysctrl.c               |  16 +-
>  drivers/phy/Makefile                          |   2 +-
>  drivers/phy/lantiq/Kconfig                    |  11 +
>  drivers/phy/lantiq/Makefile                   |   1 +
>  drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c   | 494 ++++++++++++++++++
>  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  |  11 +
>  7 files changed, 621 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
>  create mode 100644 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
>  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
> 
