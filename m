Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F442E9A37
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 17:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbhADQBQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 11:01:16 -0500
Received: from mout.gmx.net ([212.227.17.22]:39545 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728511AbhADQBN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 11:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609775978;
        bh=8dYzMDBKUF2sybRjESev4F3J9T3mj+pyYPcEcjGHCf0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=kELxTBswtIVyJ+/QfJtofwtpyWUkgh8sQIcONLr0RSeHwA6LsLkGeCeeczzzLhW2/
         WnhYIt3QoGXS8+S91ti8EUirg6RcSQJ/eFB4lv/Sbm+YIoEDuQWgZ7rLeSgmgLXMYo
         KVcaFpOjTsyHMXOtp2aLLx/UCyvh51NexF9NSUzs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MNKhm-1kc9AJ3B18-00Omz7; Mon, 04
 Jan 2021 16:59:37 +0100
Date:   Mon, 4 Jan 2021 18:01:15 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Keith Busch <kbusch@kernel.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
Message-Id: <20210104180115.b1d5438cd4ee21efcd557976@gmx.com>
In-Reply-To: <20210104154902.GA1024941@dhcp-10-100-145-180.wdc.com>
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
        <20210104154902.GA1024941@dhcp-10-100-145-180.wdc.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6uClOfvhWTGJ72YP4IUDfeJ1Nt2MWOpuMIY8iNkoeeUNdt/xJYF
 a+RuIY4ryesoovh6UA69IdknEeTEs/V6r4IpqXMG5w7dj5ujOjEmojwzgrWulg3q9RDfAyP
 Edcvyg3QfcinkNwaNucBPvycXSFsR8dKQm3eg18dRCObIlvqJhXTM/fzZrGl7BMqFNNG7b5
 q5leAjr5k03tZQ06L4eBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8TcCjfE8g28=:MzQilyLcksyyXW8U9Ia++S
 fV2njqadX7eiT3kJQS2nI+lGkFrxkxl38HrNhJlitJWSl6gqu5gyL25tRMPoyEYDfUMUTZvFw
 SnKoIV3c6wiLwsw3j7Wz2N4b1k2R28/7kSjhxp9J78A6J3lqpW5cdaqf+GqXMce8ejJnjTyR7
 WGacmzXlzbdcqB58YL2xQ2Aas2+3jKIAN6dkvXOQ6/OLX0SHG+UXmBd/5GDNcRg70IZVElNVx
 4rcjIQLIjUg8Xncd4w61/RNq00xP8iLFRm5+aKWRHVbb5fMmztmfTKvpFouWzmqgy51VGeG4r
 SjXwbuIbzH+qBTFqMjQvjQEhVY2NmTVBMCKptita7SKIUjlYRXZxgMXnYH/3y0jQkGOec7nbT
 5FccdWdBnUeniu49YWzbqB9gpPR0OdwkOa12tz6X7yipXEwq1k0WEbFnZ22tOw1nKT4eytAHe
 Rwzrt11xgWtBJJuWFIItNok6UUlb7Vo1LUG9yenlbAC42wKO70qbH6UQCDfNNnRF6WJIGCNnS
 2CR7W1xG5n9pzAdSQJcHpCSvwTnVgHLt+U1yY3/VFMDkQ2fTTMvrjGha4p7c4FwiuJ/7+EzKP
 UgCCDNl4GZ31BnoMdtc/DaB7tvrUg2akoe8445khTIkpwo2OTRSgDRInomF/olbDAt5C0amxV
 Xn+est2kYdsOHukG7+7Ax2oRaakLZ0iodokWLMLZ1bQfi1E27+aSsObzCnnL3Tz+howpf2gVG
 sENRy+V+5SLPSIIBUMzY3PQb7pTdFZfVLXpzqbnC4mrz9Qd2jgefaRkKIDI0MR6Y+7B9mVhGy
 5Wy24Q5qCCItHVax8kyp0GKRXUTz+AilEWpMiLjaI0bTKTUM9qNpPSCH7LX4wnLlPDHNAGRbO
 wgtZWxhdz+bP+WmTZAvQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 4 Jan 2021 07:49:02 -0800
Keith Busch <kbusch@kernel.org> wrote:

> On Mon, Jan 04, 2021 at 03:50:31PM +0200, Lauri Kasanen wrote:
> > block folks: rest of the series is on linux-mips. Being a mips-specifi=
c driver,
> > not sure which tree it should go to.
>
> Probably through mips.

Thanks.

> > +static blk_status_t get_seg(struct request *req)
> > +{
> > +	u32 bstart =3D blk_rq_pos(req) * 512;
> > +	u32 len =3D blk_rq_cur_bytes(req);
> > +	void *dst =3D bio_data(req->bio);
> > +
> > +	if (bstart + len > size || rq_data_dir(req) =3D=3D WRITE)
> > +		return BLK_STS_IOERR;
>
> If you don't support writes (is that limitation temporary?), then you
> can prevent such operations from reaching the driver by setting the
> "disk" to read-only during initialization with set_disk_ro(disk, true).

The media is read-only (but not runtime removable).

> > +static int __init n64cart_init(void)
> > +{
> > +	int err;
> > +
> > +	if (!start || !size) {
> > +		pr_err("n64cart: start and size not specified\n");
> > +		return -ENODEV;
> > +	}
>
> Just curious, is it not possible to discover these values from the
> installed cart? Requiring module parameters seems a bit fragile.

No, it's not possible. Even the cart's size is not discoverable, and
where the disk image starts and how long it is could only be scanned if
you knew in advance what FS what used, etc. There is no FS on the cart
itself, it's just raw data.

The bootloader embeds these values into itself when it's built.

- Lauri
