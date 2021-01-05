Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907262EA5B2
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 08:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbhAEHEz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 02:04:55 -0500
Received: from mout.gmx.net ([212.227.15.18]:53253 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbhAEHEz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Jan 2021 02:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609830199;
        bh=1wZhv8KBRlUR54tTGXRV20hIa/4BSeffXtfZd1ytOUw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=DAN37x0d9pHjUv3eoV/oCkpzicfjfYWSsXnueXz73xq4Bz4ztx9j7AbuzUuKUg0YV
         PJuQOfPL/uV4gXclAlWA/oT/0bDSVfPcY9dO/2j/P/JVQGsh3EDcKc7P+xShaQ0kZY
         JiJErBv3H+AGdKgFcmo0k65irIvzlZ0qEGiV/BtE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MyKHm-1k2nUp2MEm-00ykd4; Tue, 05
 Jan 2021 08:03:19 +0100
Date:   Tue, 5 Jan 2021 09:04:57 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Keith Busch <kbusch@kernel.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6 v2] block: Add n64 cart driver
Message-Id: <20210105090457.ad57e9932baab93a19d9e90c@gmx.com>
In-Reply-To: <20210104183712.GD1024941@dhcp-10-100-145-180.wdc.com>
References: <20210104195611.61997e86092b3559c95f36fc@gmx.com>
        <20210104183712.GD1024941@dhcp-10-100-145-180.wdc.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:88YrCacJ3l4wRrmVdQW9+ZenkyvEbjVUURw4ESIuNqMbiQmecCb
 r4j6nlNtefGRao7dnYqWjcXLBgaFTlemGi9cgRSVpbev6iMN13bwI3PaaRkVSupZQm+LzzI
 lsOrZtNxCX+1Bxep5cfBhRMPGOn7zjmELvepf9SQTBNgy+394iLyxq4P2lGP6RLjzr7LH4h
 T7H/gd1RMGHneiwUIiV9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Vv0BiMWNzE=:XDz89D8twNzHjPst0sRAzy
 Oq+oobheUBkdzBXTX6J7+PRzDEX/uC+I7UpdR95wCbBhNPbxYr+PMLLdOvPsyQmwb7DoF8nDD
 jmy22lZpPUY6l8ZOZIjLG/gCuoaFkZk2tkmXlYA91LdqLjp2kyEsEJc4sZEgdtwSdirAFil4Y
 xn1u5AlK+kXR21Dl2VD8/0eQoh/WLyfTJspatRNy6B1iyE9yFNLKIZXGWuX+26sch8ol+7mTv
 0GXoHmOJtp3+bJXV/GsoAud//AOUEmNGAL83ezhEITI2CYlxwq6pF00NkqwftvLBA/NDE3htf
 sRKngUvxDuxr5aphEnFWH4ZhYLqWaEDC6KB+lPvPgfaufkToMfn90tP3u3XMNUj/0EVU6Ve1I
 VnGfDJBWbNJXrDt/K8LiBjsPoJUFaGkQ7Dx8IIX2qHPD49BQ7jyWETMB8ItaFPQw4W5KPvztW
 uVt+hwj5gh1NEroe4v9womSRiuo1+XiUEe1Zx2yYCHaaIm7wBjAEl23ZIB2NVuwAexd0sQEo9
 omG88TtvGC7/uiY1H+9axS2Fn9MVW8qF6TEBQjvF9n4L2Qk8zkgqiF2937uZetOG7Dw/GgX6d
 svCuwBcCwcOVh9t4Wrn7SztuBj2gOPq7Do50jlmSFjhx2eBSrsl0c25Ao960YC30QXr4MwWXC
 X89rr8YKT9McTwFaJc93XohQBGVTKHFGjhhH8SOPCrri2IU+3OGqUoIo1HePMoQxhJNHJWlpX
 u1iI6eqg6/cMzrMv11hF88tIwCFmlvxhlAEM4ebXvt2gfuR7qDdBiJZnNTWc4yH0kIF/pbika
 HhSMUd2pT1gpHlbbB/UeHiBse4zVv4dZkQSaB2cJx0kiawOs6pK2V2TXi1Rs7jFJ9jrNzy2xR
 TnRLAC3wmxMkYie9agcQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 4 Jan 2021 10:37:12 -0800
Keith Busch <kbusch@kernel.org> wrote:

> On Mon, Jan 04, 2021 at 07:56:11PM +0200, Lauri Kasanen wrote:
> > +static blk_status_t get_seg(struct request *req)
> > +{
> > +	u32 bstart =3D blk_rq_pos(req) * 512;
> > +	u32 len =3D blk_rq_cur_bytes(req);
> > +	void *dst =3D bio_data(req->bio);
...
> > +		memcpy(dst, buf, curlen);
>
> Is there a reason for using a bounce buffer rather than reading directly
> into the destination?

Forgot to add: cacheline too. Don't want to invalidate someone else's
data accidentally.

- Lauri
