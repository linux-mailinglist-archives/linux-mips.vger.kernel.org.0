Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75523DC84
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 09:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfD2HDU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 03:03:20 -0400
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com ([46.30.210.182]:11876
        "EHLO mailrelay1-1.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727407AbfD2HDT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Apr 2019 03:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=haabendal.dk; s=20140924;
        h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
         to:from:from;
        bh=2zPNY/cLW+90UYWtDhMxkbIjGVuo2/qwkZPK5J1aSCw=;
        b=CP2vSNy756Mu3PtV+/tCzfX6N6bBGGfZKwlgWUT2H2cArhP/z70fnh24zaD9CdWJ/CVftTTS4gt2y
         lzy6ywMHBUcRWoNQim3ZF/6tQSSjIgSDKBsymx0AH22Qz5W85tgTTNBnRrDn0B9XKmkxbmpYhfGqah
         6+ZKk6oxQnrQyZZY=
X-HalOne-Cookie: 03bc1ce83dc9ecce239c19145261b37861aa8c6c
X-HalOne-ID: dcee62ed-6a4c-11e9-b614-d0431ea8a283
Received: from localhost (unknown [193.163.1.7])
        by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id dcee62ed-6a4c-11e9-b614-d0431ea8a283;
        Mon, 29 Apr 2019 07:03:16 +0000 (UTC)
From:   Esben Haabendal <esben@haabendal.dk>
To:     "Enrico Weigelt\, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        andrew@aj.id.au, andriy.shevchenko@linux.intel.com,
        macro@linux-mips.org, vz@mleia.com, slemieux.tyco@gmail.com,
        khilman@baylibre.com, liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, davem@davemloft.net, jacmet@sunsite.dk,
        linux@prisktech.co.nz, matthias.bgg@gmail.com,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 40/41] drivers: tty: serial: helper for setting mmio range
References: <1556369542-13247-1-git-send-email-info@metux.net>
        <1556369542-13247-41-git-send-email-info@metux.net>
Date:   Mon, 29 Apr 2019 09:03:16 +0200
In-Reply-To: <1556369542-13247-41-git-send-email-info@metux.net> (Enrico
        Weigelt's message of "Sat, 27 Apr 2019 14:52:21 +0200")
Message-ID: <87ef5lz423.fsf@haabendal.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

"Enrico Weigelt, metux IT consult" <info@metux.net> writes:

> Introduce a little helpers for settings the mmio range from an
> struct resource or start/len parameters with less code.
> (also setting iotype to UPIO_MEM)
>
> Also converting drivers to use these new helpers as well as
> fetching mapsize field instead of using hardcoded values.
> (the runtime overhead of that should be negligible)
>
> The idea is moving to a consistent scheme, so later common
> calls like request+ioremap combination can be done by generic
> helpers.

Why not simply replace iobase, mapbase and mapsize with a struct
resource value instead?

Incidentally, that would allow to specify a memory resource with a
parent memory resource :)

/Esben
