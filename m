Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D834842B2
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jan 2022 14:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbiADNnK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jan 2022 08:43:10 -0500
Received: from mga04.intel.com ([192.55.52.120]:3770 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbiADNnK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 4 Jan 2022 08:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641303790; x=1672839790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C1LSGlnSyj/Ydi2jbe8mn+CezILCARLbZkzxLCt5ecA=;
  b=GK+VOYLU63ryr7/joK/8KKPY8G77WCL+JjLvilujYl5cUnF0rWoQU+lh
   /tAF6IpmRhKedHcmdh6vQ4qNhZLBfQZtRcDxgDTKROKOv23EwP7aXMJyr
   9hJAHzQ17vaY3A1mV4+bRI946XEFcbBb7u8Ux6YX2Q5hacofCYLGIoumi
   v8IjLhqIgrNw44+rMDQ79cikXevJ/dlJVJFb6KRzFJgb4jfC4MMz3RYqa
   E0t9WTrm8tOMyAlIdDMiVzypjgqmMfLy0J+91AxFi8uuAjPl3X8Ct3s+z
   BFJyqYIuRexi6kOHmIQvyWcgODMxsUBOrqSURmJrxIczYP+3dPR7tX/5K
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="241042457"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="241042457"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 05:43:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="574024431"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 05:43:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n4k4V-006DdZ-5N;
        Tue, 04 Jan 2022 15:41:51 +0200
Date:   Tue, 4 Jan 2022 15:41:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        tee-dev@lists.linaro.org
Subject: Re: [RESEND PATCH v1] firmware: tee_bnxt: Use UUID API for exporting
 the UUID
Message-ID: <YdROnjYXefJfo8jp@smile.fi.intel.com>
References: <20210121183741.45333-1-andriy.shevchenko@linux.intel.com>
 <Ybeu5wWyw8E4vIVb@smile.fi.intel.com>
 <YbevI+Jg/aoKH8uW@smile.fi.intel.com>
 <20220104092406.GA18693@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104092406.GA18693@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 04, 2022 at 10:24:06AM +0100, Christoph Hellwig wrote:
> On Mon, Dec 13, 2021 at 10:37:55PM +0200, Andy Shevchenko wrote:
> > + Cc: Christoph. Maybe you can apply this one, please?
> 
> I've not even seen the original patch.

It's easy to retrieve with b4 tool:
`b4 am -s 20210121183741.45333-1-andriy.shevchenko@linux.intel.com`

But for your convenience I may resend once more with you being Cc'ed.

-- 
With Best Regards,
Andy Shevchenko


