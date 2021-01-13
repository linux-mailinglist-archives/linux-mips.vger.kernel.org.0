Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA9A2F4E40
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 16:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbhAMPOw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 10:14:52 -0500
Received: from mout.gmx.net ([212.227.17.21]:50149 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbhAMPOw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 10:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610550800;
        bh=3tzdpliG4UD297r8tnVxoxfJ1EFprU3FWq5IV2A8rYc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=Hl18wKjMv3MF1IBdf+DCYu0eijjqgmhjb2BcSU0x0+ZpdkUcP3jmkv7c8AAZSDjT3
         31LTSkK3PgxnVI/KU7HSr9dQGVC7vGyQiKKRIEAeFyBsPTCANzuYFpvXt8hGJ6uDlI
         Ttu17QEbMp9wDQxGgi1aifRCqELLWBkb2HF/1NaQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MAwXh-1koSVN00k5-00BJXT; Wed, 13
 Jan 2021 16:13:20 +0100
Date:   Wed, 13 Jan 2021 17:09:30 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 0/6 v6]  N64 support
Message-Id: <20210113170930.09343c14f680fe0bce44d5f9@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:uJ/vcm4gzP4nFr0enSTxmBO2xgi8Thhl0vmZC+lzL+RCMWH/XH4
 wt128KVUMNR3niF/m+DjZLwC2Zaug6UJH9uy4tuJE620owKukIN9k8nK+m+3gIBeLKfL2tu
 1TC/e3uMqQ92LOdtVpSdo2SfGSmYcw92j5oh5QQUtVO1DvlN1PsnNMIZZtQYdJHvRlhB55l
 OZZTgLr9Q18/2Wl1EesSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CxjMHVIsW9c=:iJbzTbginORCtpIdVf2bQm
 ghkpf/Lhhx3Ofsb3DKv7GWft8gOM/dBLjISVHrYGQxLA6BP7sRmeijXp63q6Ir0FjYr04IhsB
 0O9wkc3lIIbtejv+Y9iphqtElOwU2K8nXesYSXU5Vl/NCwVobFYKKCPaRBxpjH5R3ZgBl3IN+
 EhXMW5DMVlWU0CMVt/sSQK38O4DmDcAb0aTt8ERZLWdxWsKTi1MR2XMBNZMjJ3Hd5xLRYbs/c
 LJAqGwWOHnQgkLwtfe9llGKLNuvSVp1QJC5wiA2TAQ7togkTAg8ZD3axmlal4EzFLf9da98T/
 jH5uN/ifPGFVMxCB2oXeIQTX1DTtsQUA3umXQBXyQ2QTO3aZvoYoYW0Dr89rRkCAkU5RTTlX2
 axUAEeG9phC3DC+ZQ4/GEJMPbrL0l1db+LEPz4bnimpDSVX7KYcdZK4LQk/BH9sfut3L+1Mdh
 ByvjtZLCgEg3w7Sn652M6IocSewvhqJ1I/rv9stjCnZ2jYtSAjfkqrFBwDn7KR1nl4459gp6v
 iPksv9bxcSGijTJJ/E5Ga9UkTbnK4cBOMF6DWT7mgmKDQEg7TX0CHREn8DCfnSKt3gxBCeQ46
 TnkVw5NHOtINGL2I73Tp+pdTHv0cQ9i4rNRSFdqxmOb1443F6E+6Hj4gpycPoMy2xc+ePCI8U
 AKCmIGGrborrWD4NzTuPX64w0/CcZS2S9MleY8oKdctnmy6UxNZm1Z8Vi8zvULWenFtjY8OiD
 3c8HXcEgq95jRUtXiGMOn9Vw/EVw/Oia36/i20B4O1aFpSj0z4SkgLgrB2pEXv1az7+KBqBbn
 PuU+lI4+5AUyg+C325zneoq1isZY8joNmbA8H9zzM8Z1r++6FScdzLsFCEHs5UaGYWy96So4g
 W7bE1cvbgE2n9RgT78eg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Now that sound is getting in shape too, fresh series.
Platform resources are now used, and some unused includes were cleaned
up.

- Lauri
