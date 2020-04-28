Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278F61BB8FF
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 10:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgD1IlM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 04:41:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:17605 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgD1IlL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 04:41:11 -0400
IronPort-SDR: S9IfuG9K+IM5N6boHKVFxrLT+k4gizAa+NQvO7fqqvoM86rt1WO4dao2MD52d5vRoNZoflRL1U
 02YrJTN5mAjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 01:41:11 -0700
IronPort-SDR: i5YEEhAnHht9VuIi9juMo+L1TdxiW0t9eA9cR3mnbisgDsuV+1R4chvJ73c2NF7zlDNh0Sq4C/
 vnwJISJTtnBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; 
   d="scan'208";a="432105519"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2020 01:41:11 -0700
Received: from [10.214.149.60] (vramuthx-MOBL1.gar.corp.intel.com [10.214.149.60])
        by linux.intel.com (Postfix) with ESMTP id 7AED45802C8;
        Tue, 28 Apr 2020 01:41:06 -0700 (PDT)
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, cheol.yong.kim@intel.com,
        hauke.mehrtens@intel.com, qi-ming.wu@intel.com, vigneshr@ti.com,
        arnd@arndb.de, richard@nod.at, brendanhiggins@google.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de,
        masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com> <20200427175127.0518c193@xps13>
 <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
 <20200428082759.25065146@collabora.com>
 <38334812-21b9-5b2c-db84-01c9eacc84d0@linux.intel.com>
 <20200428084704.5e04232a@collabora.com>
 <f72b5ae0-b0ac-61b8-8f64-c0e0f48afe02@linux.intel.com>
 <20200428094049.3c0d4730@xps13>
 <3ebc42d9-f8a8-0764-ff7f-82beeb0b5bb7@linux.intel.com>
 <20200428095459.6727fab0@xps13>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <e5afcd41-c8a3-0dc2-8c5d-5328b07b1058@linux.intel.com>
Date:   Tue, 28 Apr 2020 16:41:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428095459.6727fab0@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miquel,

On 28/4/2020 3:54 pm, Miquel Raynal wrote:
> Do we have access to the spec or a register map? We could tell you very
> quickly if it is worth the trouble. But I am pretty sure as well that
> the controller supports more than 1 CS.

Got it, will update the changes to support multiple CS as generic-way.

Thank you!

Regards
Vadivel
