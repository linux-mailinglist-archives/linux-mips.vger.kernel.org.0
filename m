Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5FF2E9B36
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 17:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbhADQl7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 11:41:59 -0500
Received: from mout.gmx.net ([212.227.15.15]:45213 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbhADQl7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 11:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609778424;
        bh=zlbexe1B0b05XFfWpCktzbUsCRk9HtP20jtsuYaFuIE=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=caIPwRstLRT5wbyESNgGb5sNB5zpsyHlYXSpEpr9w6DU6WfnPtJhxd628ifxOUhpv
         OtOY2fI5/5dYT91eAPADUxTbpvS+S/iQ5cyp9Uz8NgDz0kH9S2GClPhJfPTIUbDQFd
         qDIb2pmBuoAT4vxMiloa2RVItrRCFNmTNC7lztBQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MhlGk-1kJ1Pj3vW4-00dkvI; Mon, 04
 Jan 2021 17:40:24 +0100
Date:   Mon, 4 Jan 2021 18:42:01 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Keith Busch <kbusch@kernel.org>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
Message-Id: <20210104184201.d11587798c082c0e6b4e25dd@gmx.com>
In-Reply-To: <2e65539c-f8f2-d205-527a-0efe2ad8ac95@kernel.dk>
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
        <20210104154902.GA1024941@dhcp-10-100-145-180.wdc.com>
        <20210104180115.b1d5438cd4ee21efcd557976@gmx.com>
        <20210104161332.GC1024941@dhcp-10-100-145-180.wdc.com>
        <20210104182720.48a9d74b2b55f5978735eaba@gmx.com>
        <2e65539c-f8f2-d205-527a-0efe2ad8ac95@kernel.dk>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1RHOmLNqtt++e8emm2jPyEExUK8W00kFT6/DdIMpWL1Tgw7L/rf
 nZV37zzsoBYCX4RrLZDE6JXdsR845vbmR4cUa/9QhID8epcHnC5kU53UhQJQKiA15LER2Sm
 pDOcqn2KYYIkzwp/cfJ1HwcEp+4vmyN6ppwNF+SYEOaWnq86N1n/QgXHjwYNevLjPUSByA/
 H9csYnLiU76TmNmuP6TTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+n/Ln+n434w=:DmHAhPA32kEkuq55bW1ko1
 Xa/LEtKYl88lCRuKer7A6gF/IYhIxI+e1xGL9hXl/USL/bsinJ1NRrtIRWIbprwyraZJM2zIW
 a/4qcmGUWvtFZSaLXnkwGVUxXU66SemVofzJhNAh5VyDVfjxc5bq10l7jSRwpkbZdZyjjhC/a
 AQhhlIO4VqcTRfDlieVPi11LsF01mjcXlh5YIAl+Y5n7VwHGO+UeBEmpfpwyi5K9EXplGLKah
 8zapZT1ETqEVpDyeAVSgB52n26zQPQKAb8gPSxn4Z3L5PmbuKaoYahDYNhVYqQAPKCu1EE11P
 azD8uJ3iL/3Cooui72JBFtdTrn+8koLCTuj7x4UB+la62S90W4v/2Qgb86oTKsGoiQCJZszIn
 sgIjYGkFruSmMidPz1asq8/DAYGmHsCxQJ+zxeih6O9XB2fhGAAXjG0iFrprOxnIYuDqR2mUx
 w7AGPW0JrtXnm10i1CSHktxzH9KlyMxh+b0oUN1F80AQEHKnOYaJnljcGf6v1DJBcboyR2Uxd
 4ZynSOvXO6Dc+7Pq4ncxe4Uwzva3adVcFAJ3WTX7B/ZMO94JVcGslywb7AOPwokkW/taZrHsf
 KvnrfJsfVem3A7AOM08eNvw6IUed8l+BhcteXRcYejJhdAQGbfIPicGXjojMqltG7B6M0Jkt0
 SMBYaE5Mzfo9Gk3AniiYinBLMcXcXGST0GaaxA3wK5Gkz36RcU49y1/Nj1o29ibNH/YnXyrzD
 j2GcOCJEPKHpTOmKEYrCKQt3MY89fxNtVq/ZKUxeJjXD3n4vQGhIqodC409uNdt6ANhzo/xWp
 P5i3lt5PdKfteV1c3pl8LMh9K0tpFrH/AK3aAToSHt4LsCn5XgcttFD40OKRAajsduXNF74A6
 XRrD4UcnecFSDCc/hrkA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 4 Jan 2021 09:28:44 -0700
Jens Axboe <axboe@kernel.dk> wrote:

> On 1/4/21 9:27 AM, Lauri Kasanen wrote:
> > On Mon, 4 Jan 2021 08:13:32 -0800
> > Keith Busch <kbusch@kernel.org> wrote:
> >
> >>> The media is read-only (but not runtime removable).
> >>
> >> It's been a while, but I could swear we can save state on these carts=
.
> >> If so, it sounds like that must be separate from the media this drive=
r
> >> is accessing, so is that capability provided through a different driv=
er?
> >
> > Saving uses a separate mechanism, and there are several depending on
> > what type of cart it is (no saves, flash, eeprom, or sram). If the car=
t
> > has no save possibility, there is an optional memory card attached to
> > the joypad controller.
> >
> > Currently there is no driver for any of these.
>
> Maybe it'd make sense to make this runtime configurable through configfs
> or similar, requiring boot parameters (and hence a reboot to change
> them) seems pretty iffy. Similarly, why isn't it available as a module?

You can't change the media without a reboot. What would be the use?
(it's not possible to have multiple carts, if you're wondering)

The lack of a module option is because the target system has 8mb ram.
The kernel is already very bloated, at one time during testing just
enabling the smallest IO governor (mq deadline) caused an OOM during
boot.

Same for configfs, debugfs, etc. No such options to save RAM.

- Lauri
