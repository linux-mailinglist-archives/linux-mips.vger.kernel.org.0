Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD9C473620
	for <lists+linux-mips@lfdr.de>; Mon, 13 Dec 2021 21:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240680AbhLMUiz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Dec 2021 15:38:55 -0500
Received: from mga05.intel.com ([192.55.52.43]:1556 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242021AbhLMUiz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Dec 2021 15:38:55 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325097484"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="325097484"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 12:38:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="544912362"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 12:38:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mws56-005m2S-84;
        Mon, 13 Dec 2021 22:37:56 +0200
Date:   Mon, 13 Dec 2021 22:37:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        tee-dev@lists.linaro.org
Cc:     Christoph Hellwig <hch@lst.de>
Subject: Re: [RESEND PATCH v1] firmware: tee_bnxt: Use UUID API for exporting
 the UUID
Message-ID: <YbevI+Jg/aoKH8uW@smile.fi.intel.com>
References: <20210121183741.45333-1-andriy.shevchenko@linux.intel.com>
 <Ybeu5wWyw8E4vIVb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ybeu5wWyw8E4vIVb@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+ Cc: Christoph. Maybe you can apply this one, please?

On Mon, Dec 13, 2021 at 10:36:55PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 21, 2021 at 08:37:41PM +0200, Andy Shevchenko wrote:
> > There is export_uuid() function which exports uuid_t to the u8 array.
> > Use it instead of open coding variant.
> 
> Folks, is this orphaned driver? Should we update MAINTAINERS accordingly?
> If not, why review is not done yes for more than half a year?

-- 
With Best Regards,
Andy Shevchenko


