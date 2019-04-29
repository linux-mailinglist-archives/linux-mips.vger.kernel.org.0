Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC9CE602
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 17:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbfD2PUC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 11:20:02 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40332 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728302AbfD2PUC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 11:20:02 -0400
Received: by mail-ed1-f67.google.com with SMTP id e56so3190384ede.7;
        Mon, 29 Apr 2019 08:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=dPnq76BudBLUCskM0DaeuuctlwoGzT39qQr2q1xJdTg=;
        b=BBvSV/SrDNJ31+/UOkSM5bpG5QGX9iuVEAlHSpvrDOGj+4PW80QrSA2NQvvNYxzojp
         Zd++WkJIJdsJI48+0P5HrqTBvNXDC1r245KbMoADl3uY5vH+mVrnUi6+8qjpF2ydE+tq
         TwF1hj4480FhhbTHgn4M/QznEs6p0sHaHA9yrWx15VQqD4rerfkEYjhIuk1lUIvL8NJx
         M8wE73xeYfkcTLVAM5oCB5RVNjauTgvl4PjUAhsoMUZ5oTPhnvZ5wvz6bSMifDGNwT/e
         KSK9tYNcpfIF8GPBuVeJpf2B9oLlA2ItKshISp7tatkcaGkzhTIiD3dveMl7nJ6B+iIV
         zmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=dPnq76BudBLUCskM0DaeuuctlwoGzT39qQr2q1xJdTg=;
        b=W9s1t/OgV8qqBHvXotuEhe3Mhiwgpg6UMb3tlgDwdL7vTbfT1IIsA8F/0zGK7S5a17
         fS6q7av8lzSl6yU2Jxju9wOisr8eM5BTihFR86/+hE+d9V8Qnx27Sn1JRCPMYDaoi8M3
         nNMoM5Xx8EMeLOghY2QX1ly1XTuS14trK8M7b+wsoPQ/bBuSjaJEcapV6EdYuv7O6Nyn
         5wEw4hhAtE2c+rZYaSWkrvQHt49M1AO+Xr6n9LoIdzFSiu+zHkcHSaNp6zVnZm8o+aD/
         4XRMEWtw8/+cmjbPqsP6m1o776u3kJQfOabTge5T7UwrLkwz4fwPidRXVz8e0QQ9c+vh
         BFAg==
X-Gm-Message-State: APjAAAUfR1FaZgE9tCuK2LQjYH9E/Js7R4wAnV4/ThnKNrmvofTXIN+8
        lw3oL/YYSNUvlIzDIMUlvTM=
X-Google-Smtp-Source: APXvYqwQbi0omP7jYdcby2odHruq4pxaQ7sP2Qij52VODZOog6lth6WIRzjEKd0jUTWzRbOuB+nVlQ==
X-Received: by 2002:a17:906:2482:: with SMTP id e2mr12684688ejb.289.1556551199464;
        Mon, 29 Apr 2019 08:19:59 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id p18sm5851269ejm.4.2019.04.29.08.19.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 08:19:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
        (envelope-from <peter@korsgaard.com>)
        id 1hL84T-0000dV-Kj; Mon, 29 Apr 2019 17:19:57 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     "Enrico Weigelt\, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, lorenzo.pieralisi@arm.com,
        linux-ia64@vger.kernel.org, linux-serial@vger.kernel.org,
        andrew@aj.id.au, gregkh@linuxfoundation.org, sudeep.holla@arm.com,
        liviu.dudau@arm.com, linux-mips@vger.kernel.org, vz@mleia.com,
        linux@prisktech.co.nz, sparclinux@vger.kernel.org,
        khilman@baylibre.com, macro@linux-mips.org,
        slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
        linux-amlogic@lists.infradead.org,
        andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
        davem@davemloft.net
Subject: Re: [PATCH 13/41] drivers: tty: serial: uartlite: fill mapsize and use it
References: <1556369542-13247-1-git-send-email-info@metux.net>
        <1556369542-13247-14-git-send-email-info@metux.net>
Date:   Mon, 29 Apr 2019 17:19:57 +0200
In-Reply-To: <1556369542-13247-14-git-send-email-info@metux.net> (Enrico
        Weigelt's message of "Sat, 27 Apr 2019 14:51:54 +0200")
Message-ID: <87muk8rg82.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>>>>> "Enrico" == Enrico Weigelt, metux IT consult <info@metux.net> writes:

 > Fill the struct uart_port->mapsize field and use it, insteaf of

s/insteaf/instead/

 > hardcoded values in many places. This makes the code layout a bit
 > more consistent and easily allows using generic helpers for the
 > io memory handling.

 > Candidates for such helpers could be eg. the request+ioremap and
 > iounmap+release combinations.

 > Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
