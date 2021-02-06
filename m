Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7859E311F1D
	for <lists+linux-mips@lfdr.de>; Sat,  6 Feb 2021 18:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhBFR2q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Feb 2021 12:28:46 -0500
Received: from mout.gmx.net ([212.227.17.22]:50659 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229715AbhBFR2p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Feb 2021 12:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1612632417;
        bh=FSHSMR3+epyEoGOWn+GBPxMtU05puYCj4o407Ut46H8=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=hls1Y240HsVZrm1LMCt35w7THyLhHjBcLNjaZnietizfxsfeUWwCQ1jxU27SEmzMS
         1MXEdIIp+/EsalCyH2azTXhiRITtDU9OrXZV6AxyNzgVwBwkWzbByKHycPX8lP8d7p
         Q2ce5epf2oYXTXE6xSLl/qnGulpwwQ0hVN4Hkqqs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([87.94.111.216]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N6sit-1lzt3W0zT5-018LKM; Sat, 06
 Feb 2021 18:26:57 +0100
Date:   Sat, 6 Feb 2021 19:28:37 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v11] block: Add n64 cart driver
Message-Id: <20210206192837.5ecec54cc5ac120ade1d5060@gmx.com>
In-Reply-To: <20210123124210.GB458363@infradead.org>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
        <20210123124210.GB458363@infradead.org>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:quvw3zq9+dUhyqkjiVEWFXI5iU1rv1IlqvDbHp1gIeIOy0VxiN6
 rcfokB/0eUFcy7jsGLn0E5KRMe2qtNH+2IfkUQCAOARbM5YkqPVQorIKJSlxA8iaLcEcgcK
 tsMphdIqW1NbOJb1x70vYtGheDOAIwoM0msSYLUizZ/dy75i0SGhI7NSl+eGJ+LAJOFsAgp
 ztpF612O8uj85sRu8tMFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ODsxNitNhH4=:CUAz7QG19sdg60wZ/cixNC
 jii5q2mGxQj8KwNBWLxYFJm2X9AMTfornNjn92lQNpO2DhZJXIG+bN6BOq+wJP37snHW1OA4d
 CfPuJo7BQxP/yEMs3MkIj+MO4xOKND7cn0KyIKjN65iIYBaXPmpcuSHEOr56q20OgmScUHeXb
 uLRF+983fNJh2LxcQTymnGW2y4+pVOcj7wBHsBSvdLs/3F9Qg9LDxPddltHGVCjTRXU8QjcA/
 1ddQjiB/h/EX3MCgUcdv4fS6X04J2aFeYEIqqZrEHi+5qNC9+t8LsNbSYEaC1+eUWdwpJ5J1a
 ZU7skWY+7++lIPCNvR97z74NEoRF/3RBjxAaGPHa/xvF8CLxP2xJ79Cs83LHONkeFAl2hCV/n
 oT9ZZaP4C+4Yaw04EXiJEUpf+S4vx+qWgxHABgfks9d0bEoh9mwBIvytkMrdYIvoSHbYvzeMI
 nhZFdPUMJOBC9Od7GcyYVAAP4oOm5ZXy9ieTFeykze3jMijVt9q42R3sZaGuBzib0+VHVzxHp
 +/GvLwNFCbnJrtdSyH/oacV+JWXdHunHQ2hOhKFlGOjSgmyBYiN4LNZXAiIk3j7HgnlCDY5Q2
 gswNlUoV7bTQxNxALB8dQjFx6Lx487ydWhU8PiTAE5poBI/blqDKYEMg3DwEj5ZOLJKgg44xN
 PGVzoh8jHzhp3mW72FTdMX4BwG5uA601zy5wuss8X97qsryhhIcCpUJNA9KZYGD2bEHkUt+q3
 UHXpAS/P82svJAD2wiru/PRhzXi7yIXzQ+agTbFu0E4m0PRBgkGLS1zyJPy9MoNNDRv2tKYX0
 jB7CCdwpa+2pBYx4roZzzOeRtyoS3UuMWXjc7AGi3l8pwKi4KfEoWE0OTgypEyMK69SAJ76iI
 b1Ivu6mvwx7iFVaohinw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 23 Jan 2021 12:42:10 +0000
Christoph Hellwig <hch@infradead.org> wrote:

> Looks good,
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Hi,

Ping on this patch. Thomas, do you want to pick it up?

- Lauri
