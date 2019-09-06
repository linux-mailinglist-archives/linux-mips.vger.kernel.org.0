Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146D7AB8E5
	for <lists+linux-mips@lfdr.de>; Fri,  6 Sep 2019 15:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405129AbfIFNHM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Sep 2019 09:07:12 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:7390 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732510AbfIFNHM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Sep 2019 09:07:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0F4193F3BA;
        Fri,  6 Sep 2019 15:07:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Rn2rRxYb8266; Fri,  6 Sep 2019 15:07:09 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5AEE03F248;
        Fri,  6 Sep 2019 15:07:09 +0200 (CEST)
Date:   Fri, 6 Sep 2019 15:07:09 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 038/120] MIPS: PS2: ROM: Read data for a given ROM file
 name
Message-ID: <20190906130709.GB9647@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <69a1b78886392bca426ac6f521197af06d768042.1567326213.git.noring@nocrew.org>
 <9a699dfb-b597-f674-5fd3-cef19b9db15b@cogentembedded.com>
 <4da72bee-5641-04d0-e74a-ae216874ad4a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4da72bee-5641-04d0-e74a-ae216874ad4a@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> >> +    struct rom_file file;
> >> +
> >> +    rom_find_files(file, dir, name)
> >> +        if (offset < file.size) {
> >> +            const u8 *b = file.data;
> >> +            size_t remaining = file.size - offset;
> >> +            size_t n = min(size, remaining);
> >> +
> >> +            memcpy(buffer, &b[offset], n);
> >> +
> >> +            return n;
> >> +        } else
> > 
> >    The *else* branch also needs {} if the *if* branch has 'emn, according to Documentation/process/coding-style.rst.
> 
>    Just realized that we don't need *else* after *return*...
> 
> >> +            return 0;

There is a style rule that says "use braces when a loop contains more than
a single simple statement", and with those braces we could remove the else:

	rom_find_files (file, dir, name) {
		if (offset < file.size) {
			const u8 *b = file.data;
			size_t remaining = file.size - offset;
			size_t n = min(size, remaining);

			memcpy(buffer, &b[offset], n);

			return n;
		}

		return 0;
	}

[ rom_find_files() is a cursor based loop macro similar to
list_for_each_entry() and others of the same kind. Perhaps the name
could be a bit better, for example rom_for_each_file_with_name() or
something like that. Patches 036/120 and 037/120 have the details. ]

Fredrik
