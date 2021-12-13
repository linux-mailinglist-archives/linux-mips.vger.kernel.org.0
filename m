Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69D8473618
	for <lists+linux-mips@lfdr.de>; Mon, 13 Dec 2021 21:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242980AbhLMUh4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Dec 2021 15:37:56 -0500
Received: from mga04.intel.com ([192.55.52.120]:34385 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242977AbhLMUhy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Dec 2021 15:37:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="237560046"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="237560046"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 12:37:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="613968435"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 12:37:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mws47-005m1d-Rr;
        Mon, 13 Dec 2021 22:36:55 +0200
Date:   Mon, 13 Dec 2021 22:36:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        tee-dev@lists.linaro.org
Subject: Re: [RESEND PATCH v1] firmware: tee_bnxt: Use UUID API for exporting
 the UUID
Message-ID: <Ybeu5wWyw8E4vIVb@smile.fi.intel.com>
References: <20210121183741.45333-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121183741.45333-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 21, 2021 at 08:37:41PM +0200, Andy Shevchenko wrote:
> There is export_uuid() function which exports uuid_t to the u8 array.
> Use it instead of open coding variant.

Folks, is this orphaned driver? Should we update MAINTAINERS accordingly?
If not, why review is not done yes for more than half a year?

-- 
With Best Regards,
Andy Shevchenko


