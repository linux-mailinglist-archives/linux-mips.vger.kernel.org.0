Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE8549E6F6
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jan 2022 17:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbiA0QDb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Jan 2022 11:03:31 -0500
Received: from mga14.intel.com ([192.55.52.115]:11695 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231878AbiA0QDb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Jan 2022 11:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643299411; x=1674835411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fYgwz2CYUy6X9S8wKDbHet3nwY1aK+DlV0isQZe8FzU=;
  b=MGEqaQ8f4bF2ELxBl3gwHZTkDi5Pah+X2jUrecPiupoGvnB4vBpGaxk9
   YooiMuzy5bSxqmPSV8kooyi0Sbms5+dxn6KhEqFJ3aUhGW0W2b7oJSTVB
   nRqCz/h+E0+2Fy7sgYdUWGXJ0GQp4e4zXG7iGbjeAa1wsnfDG8202RNBX
   9lR45WocQA0/AApSASOCOquKiUBdZHQ5njRIPgEqBwQYXe0WMKX3uyhIW
   SarOJNOffwul2ef9ta4ArBw29iKBvFJLkMmOvjGz+CzzMXmkKlGP8eaVG
   jpqSNlqzsRNt7Z8nqjV0IZaVFngYttWDrTotek3Mrc5ug6N4bA/QCeUvq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="247114531"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="247114531"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 08:03:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="628738405"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 08:03:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nD7Dp-00F2AV-6f;
        Thu, 27 Jan 2022 18:02:05 +0200
Date:   Thu, 27 Jan 2022 18:02:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        tee-dev@lists.linaro.org
Subject: Re: [RESEND PATCH v1] firmware: tee_bnxt: Use UUID API for exporting
 the UUID
Message-ID: <YfLB/Jw9MHUJ+Ocq@smile.fi.intel.com>
References: <20210121183741.45333-1-andriy.shevchenko@linux.intel.com>
 <Ybeu5wWyw8E4vIVb@smile.fi.intel.com>
 <YbevI+Jg/aoKH8uW@smile.fi.intel.com>
 <20220104092406.GA18693@lst.de>
 <YdROnjYXefJfo8jp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdROnjYXefJfo8jp@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 04, 2022 at 03:41:51PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 04, 2022 at 10:24:06AM +0100, Christoph Hellwig wrote:
> > On Mon, Dec 13, 2021 at 10:37:55PM +0200, Andy Shevchenko wrote:
> > > + Cc: Christoph. Maybe you can apply this one, please?
> > 
> > I've not even seen the original patch.
> 
> It's easy to retrieve with b4 tool:
> `b4 am -s 20210121183741.45333-1-andriy.shevchenko@linux.intel.com`
> 
> But for your convenience I may resend once more with you being Cc'ed.

Just sent a v2 which is basically the same :-)

-- 
With Best Regards,
Andy Shevchenko


