Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2866129B33
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2019 22:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfLWVoZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 16:44:25 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:44611 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbfLWVoZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Dec 2019 16:44:25 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c754dae3;
        Mon, 23 Dec 2019 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to
        :content-type; s=mail; bh=9Z1XdQ9xqJKfcQ8BSUajMinr9Kw=; b=rb6bRw
        K0bDszd3kX8EbSSSAx88Z9drOeT1vabx4fPo9wa8HBTKzMRpSg+4penVKIbyz3G3
        BuMj7M1cBxExrVacL+BdvXIZ65F47b7eDj91/MXaEgqykd23HdcQRryNCATOBwPb
        nzp/LQxJ3LKhRY5u3WLjrD3ULZCu0nkPepu8GHMmmvRJjm8XgPhP/rxqX9rFI6gr
        ClB5n/nzG0wsWeM92MMAMiUDKW8m3Zhgp+NngIdZd9BTy6IE2C0/Z+roSEPn8h2y
        NiwWr4bWcntnzybs2CEWLepQV+n+WEdjYV1mUvnEBEGEJ4KHZCblhLcm5VJPP1/B
        kKz0MOypcrWXOooQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1038f466 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 23 Dec 2019 20:47:06 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id a15so23732975otf.1;
        Mon, 23 Dec 2019 13:44:21 -0800 (PST)
X-Gm-Message-State: APjAAAVrpKqNbb6lulkaK7AWxaR7YbEzMk/RNxJOynfv5WrJVNr1bGcS
        lRvn33L88rALZuMfuWKOQ90cM2+rAzYu4VO8yEQ=
X-Google-Smtp-Source: APXvYqwr4RQe8vlMe+bQaQz+CqlbWw1S/2QmJCDfmRrl1DYnQU+vkOV2FqxScpmbvid7c/42ayFQEF/Oa05MHpJa3Zk=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr18809642otm.52.1577137461154;
 Mon, 23 Dec 2019 13:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com>
In-Reply-To: <20191223130834.GA102399@zx2c4.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 23 Dec 2019 22:44:10 +0100
X-Gmail-Original-Message-ID: <CAHmME9qK4qQAAi8W-Ugew0VH48oyLA4hyyekvjyHHJAzT5Ffgg@mail.gmail.com>
Message-ID: <CAHmME9qK4qQAAi8W-Ugew0VH48oyLA4hyyekvjyHHJAzT5Ffgg@mail.gmail.com>
Subject: Re: vdso-related userspace crashes on 5.5 mips64
To:     linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, paulburton@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Looks like the problem goes away by reverting 24640f233b46 ("mips: Add
support for generic vDSO").
