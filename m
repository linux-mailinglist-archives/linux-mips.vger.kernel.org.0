Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF9FE3B9
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 15:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfD2N2p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 09:28:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:52663 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbfD2N2p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Apr 2019 09:28:45 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Apr 2019 06:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; 
   d="scan'208";a="341805320"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by fmsmga006.fm.intel.com with ESMTP; 29 Apr 2019 06:28:39 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hL6Kj-0008Iz-6u; Mon, 29 Apr 2019 16:28:37 +0300
Date:   Mon, 29 Apr 2019 16:28:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        andrew@aj.id.au, macro@linux-mips.org, vz@mleia.com,
        slemieux.tyco@gmail.com, khilman@baylibre.com, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com,
        davem@davemloft.net, jacmet@sunsite.dk, linux@prisktech.co.nz,
        matthias.bgg@gmail.com, linux-mips@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
Message-ID: <20190429132837.GF9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-41-git-send-email-info@metux.net>
 <20190428153905.GR9224@smile.fi.intel.com>
 <c75f4ca9-367c-25d5-2597-75f2dccf6e1c@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c75f4ca9-367c-25d5-2597-75f2dccf6e1c@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 29, 2019 at 12:12:35PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 28.04.19 17:39, Andy Shevchenko wrote:

> seems I've forgot to add "RFC:" in the subject - I'm not entirely happy
> w/ that patch myself, just want to hear your oppinions.
> 
> Moreover, the size argument seems wrong here.

Something went wrong with quoting style in your reply.

> hmm, I'm actually not sure yet, what the correct size really would be,
> where the value actually comes from. Just assumed that it would be the
> whole area that the BAR tells. But now I recognized that I'd need to
> substract 'offset' here.

It will be still wrong. The driver in question defines resource window based on
several parameters. So, this should be supplied with a real understanding of
all variety of hardware the certain driver serves for.

> Rethinking it further, we'd probably could deduce the UPIO_* from the
> struct resource, too.
> 
> >> +		uart_memres_set_start_len(>> +			&port,>> +			FRODO_BASE + FRODO_APCI_OFFSET(1), 0);> > Please,
> avoid such splitting, first parameter is quite fit above line.
> 
> Ok. My intention was having both parameters starting at the same line,
> but then the second line would get too long again. > ...and here, and
> maybe in other places you split the assignments to the members> in two
> part. Better to call your function before or after these blocks of>
> assignments.
> the reason what I've just replaced the exactly the assignments, trying
> not to touch too much ;-)
> I'll have a closer look on what can be moved w/o side effects.

Just try to avoid

	foo(
		bar, ...

-like splitting.

> >> +static inline void uart_memres_set_res(struct uart_port *port,
> > 
> > Perhaps better name can be found.
> > Especially taking into account that it handles IO / MMIO here.
> 
> hmm, lacking creativity here ;-)
> any suggestions ?

No immediate suggestions.

uart_set_io_resource()
uart_clear_io_resource()

at least sounds more plausible to me.

> >> +				       struct resource *res)
> >> +{
> >> +	if (!res) {
> > 
> > It should return an error in such case.
> 
> It's not an error, but desired behaviour: NULL resource
> clears the value.

Oh, then why it's in this function, which is *setter* according to its name,
at all?

> 
> >> +		port->mapsize = 0;
> >> +		port->mapbase = 0;
> >> +		port->iobase = 0;
> >> +		return;
> >> +	}
> >> +
> >> +	if (resource_type(res) == IORESOURCE_IO) {
> >> +		port->iotype = UPIO_PORT;
> >> +		port->iobase = resource->start;
> >> +		return;
> >> +	}
> >> +
> >> +	uart->mapbase = res->start;
> >> +	uart->mapsize = resource_size(res);
> > 
> >> +	uart->iotype  = UPIO_MEM;
> > 
> > Only one type? Why type is even set here?
> 
> It's the default case. The special cases (eg. UPIO_MEM32) need to be
> set explicitly, after that call.

Which is weird.

> Not really nice, but haven't found a better solution yet.

Just simple not touching it?

> I don't like
> the idea of passing an UPIO_* parameter to the function, most callers
> should not care, if they don't really need to.

They do care. The driver on its own knows better than any generic code what
type of hardware it serves to.

> >> + */
> > 
> >> +static inline void uart_memres_set_start_len(struct uart_driver *uart,
> >> +					     resource_size_t start,
> >> +					     resource_size_t len)
> > 
> > The comment doesn't tell why this is needed when we have one for struct
> > resource.
> 
> Renamed it to uart_memres_set_mmio_range().

See also above about naming patterns.

> 
> This helper is meant for drivers that don't work w/ struct resource,
> or explicitly set their own len.

Then why it's not mentioned in the description of the function?

-- 
With Best Regards,
Andy Shevchenko


