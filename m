Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC44D2E2D91
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 08:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgLZHVg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Dec 2020 02:21:36 -0500
Received: from mout.gmx.net ([212.227.17.22]:33531 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgLZHVg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 26 Dec 2020 02:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608967201;
        bh=s8FoLLvk1rYur4AK4wVizo7geNdI1/z0sR2FRsmCvEI=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Gy3BhsdM0gzhthe6+UK/R7Pr43ZtHLkDNwUsjnjcMyUS8KGVC3wtQu2YmkoGOi/N5
         S8lxYEE4RIM0TNncttlZdOEwAqGq0wGZbNPV0rzDnO/Tsob8C4kXp/G3fkN5i/DyR/
         WLYMlRG45VQc0bVr2+9NsMZKPCa5I2d2Tm7aPZNQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N8GQy-1jxdtA45jM-014EhL; Sat, 26
 Dec 2020 08:20:01 +0100
Date:   Sat, 26 Dec 2020 09:21:36 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Subject: Re: [RFC 0/6] Nintendo 64 Linux port
Message-Id: <20201226092136.d780220c8550ef4b4e45192c@gmx.com>
In-Reply-To: <43076b53-4eb2-164d-3b5d-dde7dfedbe94@flygoat.com>
References: <20201225190503.12353218812e1655f56f0bf8@gmx.com>
        <43076b53-4eb2-164d-3b5d-dde7dfedbe94@flygoat.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:uJsMJylHtPDBXOejo39aQDfuJ/CQ0rx4aXrbj9g4vJi6PVMYlRG
 PlP69NgnBSQaataJBQ45ZJsQYhvEykUmEsakbgu6JqCGZC68FKYlhAZyDf49Ql643kAYy2x
 BMadcXmoSrZREJGUNEU/X4cSvgCPAW8JRO5z0G4WO7CbMzGFifoLMPm4lBoUXwmjZdcNEKj
 azZNDgijVe70LuOevkb8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3wftk0rPrrM=:IBCEC36SdNqR2RDbNUf3xh
 +hUUTYzvZ21STwqBJmheAGHxyu636V368VmkmOdyPFreTbkupbZ+JvLXBPOGaOZLw5Ch+58Xo
 aM3j7qwWYRmOyGtpUJjFTzcD9wlOVYtPtznE5Oie2fbcmAVE+PVdmx99RGkimd02AZPz0X78L
 jLyPCmgshmKeO6l9byoGUVyBdgPj7FhZgAD+yzsRRe2nW/oPmnta9seyO+pcuPTCe23breKsV
 fgyFY0yTsO4JaZUj7Avs9oLfjkXjH853pXpvJnctoheyRDzzJWe1Fh5ztT4uJI2EdppXi8gqc
 hlnSzLoj7kbGbXZYYrFNZ4OZC/MnXoALwC2YsNllrKNRYfA5gWmlnGppx9Whti6z3+p/oVKQp
 m9yzhFzMDjGZTS59DFdiOzVwFeiLqhoJEXnuJp2Jox1neDWuB4uclmj++3fwXYqiNlOfLmcej
 u5+JvtuNCURPcfJYv4cNQq5smSRTAk+C1WvlKzeAZ94P4MB2bJLm62ZUwpumbQxgqfLwzRzpT
 qdQmNFE8Eq5+CqADCwfZi9A/ruH1DsABYHt5jkRguLRtpi6gz9zY4TCRUE4OOqG6x8DIPDpi6
 S5Wm9X81+iccQaqb8d4KEDQe4UqyXtTVjKf36UIBcrK9QdDTF5wi81uPF4ZVa04Irzg71W3jl
 cU5HeKuOeJQfE0Drd/h4Ymf6Nhm3db4WNpoqe9asfpGLrh34BcRhRgEsKl5sI1+QYsBwZL1aH
 pehmdyeC8L7eMm7B76U8fQ6CX6GqUSgbg0e/PGCkYl+likPHzYVvwWSSTagQGVB9NkQ1Mc0HG
 VEiCJ3KxsJ1zJJJqqUillMXnXqaHyRHkWBqXAml/be3MawLibqMpjqYroTgi+U307UJnAB8Zg
 rV3y7JWZ+0K0Qld/M6Ag==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 26 Dec 2020 11:29:01 +0800
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> Is it possible to test it with N64EMU or something?
> Just grab out my N64 out of garbage but unfortunately it nolonger boot....

No, I'm afraid not. No emulator is good enough to run it. As mentioned
in the ROM tarball readme, I needed to heavily patch cen64 to be able
to do anything.

My cen64 changes will eventually get upstream, but even with them it's
unstable, while real hw is not.

N64 no longer booting: the most common reasons are broken power supply
(buy another), or dirty pins (electronic contact cleaner/isopropanol +
microfiber cloth + credit card to push it down). The N64 doesn't
usually have leaky caps or other common console killers.

- Lauri
