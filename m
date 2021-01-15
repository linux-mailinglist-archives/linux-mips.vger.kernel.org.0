Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029202F7D64
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 14:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732159AbhAON4e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 08:56:34 -0500
Received: from mout.gmx.net ([212.227.15.19]:49895 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731075AbhAON4e (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 08:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610718899;
        bh=ZVqDu1+/ZcW2XC8gQG61AxJtDhdnOANnGAiOTRIH+fs=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=kOX6/QpMDOGWbb/86S/AyBPeFoqqvPhUT9b1+Mz0S5kshneLtegiaxdUbjy0NVvwc
         q0/x4WkWzLP6TkNlugb6ZsoUfKBqn8mbA3Ahp1s4P0DHvfTzc3n252Tlg4nAbu4ma3
         TfnWnGWsFCexOIkVDy4A15THmaYIahFjX54rxauQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N9dwd-1m5B1a1HJV-015Z49; Fri, 15
 Jan 2021 14:54:59 +0100
Date:   Fri, 15 Jan 2021 15:56:39 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/6 v6] fbdev/simplefb: Add the N64's mode
Message-Id: <20210115155639.772f51126e5bac0126fc76ae@gmx.com>
In-Reply-To: <70447198-f7e5-ac18-8593-6a995cce6700@redhat.com>
References: <20210113171159.ed46ea46b7af0cc6cf2a85d8@gmx.com>
        <70447198-f7e5-ac18-8593-6a995cce6700@redhat.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CcMog61sZrUYltSrzr1ABLiPI7lZ11F2DfSPc8CRsgfz9cYnVyC
 M6PeUorKLZAJ1BksSJZ0iQ6Ofptx15i03WJnhDlRCAwGJSh+G2HT5eg3ObNfgqINa1UOz5k
 jU3YQuwIZ5NDKZmmbygwU73uGGDiKQXhg3cPpBa6P0kJdtyAVjJcwtgjaz3Kc4noV9AhUT+
 oZizlLzYcS3wCsxQlEp5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E2ShWKwrFyI=:bW2lwVZ8lECxU/lncISC/D
 3R0ks/k4SRj+W1iBFU/Vvj1x3NHN93kwcpERsY04UD3oibf1HmpO08olnuJxxeBCbXQ6VPbVm
 vEHD1rQOPSFGm6h5NGHPsSv1Tq6X2wao4ST4xWpxoh7sFOcSNQmxAT4iDDvwBroj3G2tlH9lx
 jnej9RyxrwtXwEdqbumgCiBj8KfXPtjYLP2Q6dusRHKO3voN5RVqkuATdfJdoDh0wWA9HUWyp
 EI5FCg03I20IMGLAYBES2iNyW7iQTEwcRnZzA1rU0uc8DS52cxneAs9HjDBz2SPargQv6hdqS
 Xq/t5kouFk2hap8CoErepobAXk85N04sxGZ9rW2g3m8zJQwAJcDhcbqOyqi7JWKhy0QqrgCka
 IM1lxDo91qGM+O3w2J81VMeiJLPT59FF8UjYs77xM7awzmxdRGxvNMZoYbrPudNwPiKj6FYK9
 iEiuKM6Ptij/ibeMfG7aNluT+Jfw5IjuMDdt+TNIEv5VUYy2viglE0obvQA49B1JXvhxYe/Jo
 7CdV0xzu3ijmh/FQGoWgN5PsexbbjLhKJhHEd7cgOnkJb3inEqpPFBB7OjUbMwnIvn5sTjX6Y
 /7rxMi7LfQEV0k7Zz+S8/rJwj3oND0gXIwuL6qQXTEieMgI5x/eccT7/C4bSoJ2zNrxhmXjZY
 ouL6ZpfIgLh8tnK0vUNEUifCSVzPT6bfqNhBLXTHt5zOZJLJrGEdIf+AUgmZJ10Bv/F+IDigy
 iuwTdNYQhxxjsZvNHCtrmwwoLGgrkuWoBUOUW7YE4vSemQRDvG8FTlMQjHDRv5Qojqgq2/fLL
 TqlGR5Qw3bTGJaSwzO9HpbgwtUwvM/zapVSl9yWmrxEJP9AbASBL9rndKkFnv6oV2u2i+JFSH
 qsaYscZ7ul42MPAC7zNg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 15 Jan 2021 14:01:36 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> I am honestly not entirely convinced of the #ifdef-ery this adds. I unde=
rstand that RAM is
> tight on the N64, but this saves just 700 bytes, which even on the N64 i=
s not a lot.
>
> Right now it might be just 1 #ifdef for the N64, but if other platforms =
follow this example?
>
> Honestly I would prefer to just see the format added to the existing SIM=
PLEFB_FORMATS
> define without the #ifdef.
>
> Alternatively:
>
> Are you using devicetree or are you using a board.c file to instantiate =
everything?
> If it is the latter I guess we could add a const struct simplefb_format =
* to the pdata
> and then just pass in the format directly. I can even imagine the code w=
hich uses
> the SIMPLEFB_FORMATS having a #ifdef CONFIG_OF around it in that case to=
 optimize it out...
>
> That would be a more generic solution which hopefully will save as much =
if not more
> space...

No devicetree, and CONFIG_OF is disabled too. All init done in the
board .c. Not looking to get too involved with simplefb though, so I'll
be sending a patch that just adds the format.

- Lauri
