Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC8E1613B1
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 14:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgBQNi7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 08:38:59 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:45118 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbgBQNi7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 08:38:59 -0500
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23990923AbgBQNizHwSiF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Feb 2020 14:38:55 +0100
Date:   Mon, 17 Feb 2020 13:38:55 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Paul Burton <paulburton@kernel.org>
cc:     "Victor Kamensky (kamensky)" <kamensky@cisco.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
        "richard.purdie@linuxfoundation.org" 
        <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
In-Reply-To: <20200211170110.ewrndsh7zzx7ocqi@lantea.localdomain>
Message-ID: <alpine.LFD.2.21.2002171333100.2579827@eddie.linux-mips.org>
References: <20200203233133.38613-1-kamensky@cisco.com> <20200203233133.38613-2-kamensky@cisco.com> <20200210191424.brqyxs5lq7eqounl@lantea.localdomain> <20200210193301.ella5mokkudw3qgs@lantea.localdomain> <BL0PR11MB3219374C9349EE1B4F174777CD190@BL0PR11MB3219.namprd11.prod.outlook.com>
 <20200210225229.4px5rljkici4mlrj@lantea.localdomain> <BL0PR11MB3219D6C91AAD980EC3BFED14CD180@BL0PR11MB3219.namprd11.prod.outlook.com> <20200211170110.ewrndsh7zzx7ocqi@lantea.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 11 Feb 2020, Paul Burton wrote:

> > I believe my second patch: build time check for 'jalr t9' in code
> > should still be useful, since it verifies that conversion to 'bal' driven
> > by -mrelax-pic-calls does happen.
> > 
> > Please let me know if you have any additional feedback before
> > I post v2 set of patches.
> 
> That sounds great, and nothing else springs to mind. I'll look out for
> v2.

 BTW, while at it you might want to verify that the microMIPS variant does 
the right thing.  As I recall there was an issue with the R_MICROMIPS_JALR 
reloc that I meant to fix, but didn't get to before I left MIPS.

  Maciej
