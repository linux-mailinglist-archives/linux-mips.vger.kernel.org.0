Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B277F28BEF9
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 19:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404069AbgJLRXP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 13:23:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:47286 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403928AbgJLRXP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 13:23:15 -0400
IronPort-SDR: vIAgJMVrN7QJlKSpYqn2d9cmvAOW2xERTCB3sq8nnTCjzSHB/SrEzOg5q0/VgXvS+wgnuPNlRy
 9+e+8ZL/anNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="152704706"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="152704706"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 10:23:13 -0700
IronPort-SDR: x7ZJeUHCu57d8fDI5o9Qdf7kkWd8o8z+zH+CqVV0PIRflTa4qr15OHQxqqS5IIfasZiaqE/5kZ
 z0Uz2VWoOn2g==
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="463179250"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 10:23:11 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kS1YU-005Am3-Dm; Mon, 12 Oct 2020 20:24:14 +0300
Date:   Mon, 12 Oct 2020 20:24:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     op-tee@lists.trustedfirmware.org
Subject: Re: [PATCH v1] firmware: tee_bnxt: Use UUID API for exporting the
 UUID
Message-ID: <20201012172414.GJ4077@smile.fi.intel.com>
References: <20200422130021.38424-1-andriy.shevchenko@linux.intel.com>
 <20200618105648.GP2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618105648.GP2428291@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 18, 2020 at 01:56:48PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 22, 2020 at 04:00:21PM +0300, Andy Shevchenko wrote:
> > There is export_uuid() function which exports uuid_t to the u8 array.
> > Use it instead of open coding variant.
> > 
> > This allows to hide the uuid_t internals.
> 
> Any comment on this?

Guys, who is going to pick this up?

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/firmware/broadcom/tee_bnxt_fw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
> > index ed10da5313e86..4cf0c2576037d 100644
> > --- a/drivers/firmware/broadcom/tee_bnxt_fw.c
> > +++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
> > @@ -197,7 +197,7 @@ static int tee_bnxt_fw_probe(struct device *dev)
> >  		return -ENODEV;
> >  
> >  	/* Open session with Bnxt load Trusted App */
> > -	memcpy(sess_arg.uuid, bnxt_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
> > +	export_uuid(sess_arg.uuid, &bnxt_device->id.uuid);
> >  	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
> >  	sess_arg.num_params = 0;
> >  

-- 
With Best Regards,
Andy Shevchenko


