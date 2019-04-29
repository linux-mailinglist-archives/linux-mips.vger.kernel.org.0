Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63924E459
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 16:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbfD2OLv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 10:11:51 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:45011 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728119AbfD2OLu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 10:11:50 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N9d4t-1ggOYm2XMj-015Xti; Mon, 29 Apr 2019 16:11:21 +0200
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, andrew@aj.id.au,
        andriy.shevchenko@linux.intel.com, macro@linux-mips.org,
        vz@mleia.com, slemieux.tyco@gmail.com, khilman@baylibre.com,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, davem@davemloft.net, jacmet@sunsite.dk,
        linux@prisktech.co.nz, matthias.bgg@gmail.com,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427132959.GA11368@kroah.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <e10175d0-bc3b-a4ab-cb47-0b4761bfb629@metux.net>
Date:   Mon, 29 Apr 2019 16:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190427132959.GA11368@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:w68pyQn6kRKE7GRI8D4DIjXrIG1rM4JVO8YNhN1PjmA9qeJlTnd
 FRfk7wZg3723UrBQe25rwfOnwSzGszEb1MIoCQQLNzhyCTgLVqEInQLMVDSZ6SrfQMpGeUD
 sSICNMoMdNK6YaqchK3BXnaBaPE/dmfwd/DCv3Rgt3Peb9t9zVGwhF+PiwHnSknkczZ5jwA
 iaTSwPj+i6uzJ5jOg0EOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GSBkrDSKESA=:2lO9/amCuq6fFF597Ih05m
 lHF5oKmclj72Zzkyd/7n7OIiwaRhSBo7oYOd2+ffp/NEUvN2Jn/raFhf0e6E8K+EU2aJRWYj6
 xPazKtRy6+71hDxb8N8/muna5/ompU5XUHAHWvNiNsi3xQSwdRdyVk8toFHaLpavPormaaAC5
 x6cZ0/wtOs54z6LsUIHciLayFiB+BmZ83+sLMyUYXe0KBI/zPixrZD+tu0VcsfcS7r7VYQj4/
 JjNFl9B8X8o/Sjh9uG6Y3vBTGv49VcPY/5tQwUnsC39CoM168B+bxUNpEQ5zA3Jhrk95A+B1n
 6nETxBNJQ3EbF6WPXuX4E75BpNeVCeXQKfLnBOd3nrSBkj/uFH76O1vrWS4AgsfOTt4MHiI62
 WKvPVRgqATCb3N2+oJ8px9tLb4lTxX6XUOOyI503AcT66SDfLFH39tMUPPkDqizBhpx9VxXp2
 FfZsnVaVxHhAOPNsBpVjuzon/QzxCbElmVdBDB7ooHtQ3iaspczt+e5dMm0V3iq1okxyFRY5F
 F/WoUUpE4JmdzZv6STWYNcXwQiTMhpJKgYW0+6X2Vmh2qw16Aiuqtn+H6LLyYHl3ToJgVosT6
 IXgBwLjn12BZ5AjiiM6dfeDhbcZqWNCFedbIreNfGBORb11xOTrYSFbUOSyh0j1BEZIcGO+gz
 XzZByfB5wMLlxYXWanXG9Wg07pbtgY6qOVP/x1S66+XQvoODts6tl2AdS2HQ7qtZOiBu6Jcml
 CvF1VoxkjSF83yH+uX/lseAL7VLzTmM1k9ETeNvnTFIEjvXYr5L640CRVkc=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27.04.19 15:29, Greg KH wrote:
> On Sat, Apr 27, 2019 at 02:51:42PM +0200, Enrico Weigelt, metux IT consult wrote:
>> Using dev_err() instead of printk() for more consistent output.
>> (prints device name, etc).
>>
>> Signed-off-by: Enrico Weigelt <info@metux.net>
> 
> Your "From:" line does not match the signed-off-by line, so I can't take
> any of these if I wanted to :(

Grmpf. I've manually changed it, as you isisted in having my company
name remove from it ....

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
