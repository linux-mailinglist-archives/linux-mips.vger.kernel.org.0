Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E6A1DE50C
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 13:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbgEVLHm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 07:07:42 -0400
Received: from mga06.intel.com ([134.134.136.31]:53504 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728281AbgEVLHl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 07:07:41 -0400
IronPort-SDR: CmdHAY6W1HLB/zjzYcaJ7ckUD92W4TFQpY0wsE1E1R+QlbYxzBuzdxqLzs1O8FUk8K/hRrWloP
 XtPtkZf20jOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 04:07:40 -0700
IronPort-SDR: Z2zqdpxfd8/g00epIfPGpigaTa+qxHKoNiRQBqNKxGV4N6uOKh0iwJfi0J9xJbBwZsRRKx++3+
 ByVCGDiH1yiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,421,1583222400"; 
   d="scan'208";a="255567112"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 22 May 2020 04:07:35 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jc5Wc-008DYn-7B; Fri, 22 May 2020 14:07:38 +0300
Date:   Fri, 22 May 2020 14:07:38 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, John Garry <john.garry@huawei.com>,
        Chuanhong Guo <gch981213@gmail.com>,
        Joe Perches <joe@perches.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/16] spi: dw: Add DW SPI DMA/PCI/MMIO dependency on
 the DW SPI core
Message-ID: <20200522110738.GV1634618@smile.fi.intel.com>
References: <20200522000806.7381-1-Sergey.Semin@baikalelectronics.ru>
 <20200522000806.7381-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522000806.7381-13-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 22, 2020 at 03:08:01AM +0300, Serge Semin wrote:
> Seeing all of the DW SPI driver components like DW SPI DMA/PCI/MMIO
> depend on the DW SPI core code it's better to use the if-endif
> conditional kernel config statement to signify that common dependency.
> 
> Co-developed-by: Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>
> Signed-off-by: Georgy Vlasov <Georgy.Vlasov@baikalelectronics.ru>
> Co-developed-by: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Signed-off-by: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Here and for the future, when you add somebody's tag, drop their appearance in
Cc. git-send-email automatically converts known tags to Cc.

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org

-- 
With Best Regards,
Andy Shevchenko


