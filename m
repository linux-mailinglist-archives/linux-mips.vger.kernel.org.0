Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6429B2F120C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 13:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbhAKMCW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 07:02:22 -0500
Received: from mout.gmx.net ([212.227.17.22]:39477 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbhAKMCU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 Jan 2021 07:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610366442;
        bh=Mq0iZdB01RKqKpqtCzdog8n7k6uJk01q00MBm4/rhLs=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=bGr5GN+NQegueLvNiuXZuFIIJA70Mz18ip217g20jQ5Ic7sjieOwD4EC4jkGkGjQw
         12n5UoSM0aNfRkyxQOLTKAVwEA2Wa4I/oWsuFuX2SH8OTacR5ORrsAiN5k4wKROHnC
         Gl7vK6YRqlIFUFBfavTSn6SfHurU88rEQJ/iMe0w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.165.132]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MGQnF-1kidvD260r-00GqHm; Mon, 11
 Jan 2021 13:00:42 +0100
Date:   Mon, 11 Jan 2021 14:02:22 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        perex@perex.cz
Subject: Re: [PATCH 5/6 v2] sound: Add n64 driver
Message-Id: <20210111140222.bb15bb75657fbb8a5b6863dd@gmx.com>
In-Reply-To: <s5h8s8zvl44.wl-tiwai@suse.de>
References: <20210108103513.336e6eb9ad323feff6758e20@gmx.com>
        <s5hsg7byezb.wl-tiwai@suse.de>
        <20210109092303.b9a2a2f678a5d1b19b7f27f3@gmx.com>
        <s5him86wmnr.wl-tiwai@suse.de>
        <20210109194601.f94ca38b2b99ddeb15705993@gmx.com>
        <s5ha6tivutv.wl-tiwai@suse.de>
        <s5h5z45x24r.wl-tiwai@suse.de>
        <20210110091536.b3bc5dce2ef9d6c94d3eb873@gmx.com>
        <s5hwnwlum21.wl-tiwai@suse.de>
        <20210110190332.8a818e931975f02b8f3d3881@gmx.com>
        <s5ho8hwvh91.wl-tiwai@suse.de>
        <20210110194146.58cf1d6d64a7fbc6d5336210@gmx.com>
        <s5hk0sjvqz3.wl-tiwai@suse.de>
        <20210111114323.d522f6e30a705d0731b41b93@gmx.com>
        <s5h8s8zvl44.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GVTA2YyeiF1nm5taJGGt7x+nEfNl1bU6rSZEl18IFVFHzaualkb
 RUAKB6Lu4Ptt1uo0rJPdIe5XjrFseG1RmkKXe2oq4aGb/3HRCQAO+0khvHEhvBE8J8dY4YI
 53BWAijqIQGRxgo2BZavRz9i1oJU55UAm7S8uvs374Ohn5xLrLSkASmjRPYUUNFBKVl58Up
 ULTc21xwja8nW/4AaGvsw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ngPh04ZVoU=:WAdcue1v5IjnAvHrsCu1Oc
 Nz7vJdIm78wISbNlB6BG1zpqXpmDbuYeoHYDGrtuGHRXuhHb8mnaCJPoJUn5aaRYFUA8p7rye
 Ojga9aSPEFE8laUkOm+EujnlKBFU4eHbvW8nGyK0m4SXBHvy+LmA84vmykRw7eYIV+UPWjuVt
 /OrJjr3B2zftkjOSfXMdu71yorXv0zbkQkSyeC0r/Kv5MHlF+EyCEh0n8IV/TZ2I7b7i9hpHZ
 yoWTxgxayoKRusuURRXtH2gPvqJ6ByyhW59pnVAQa8PogWPammCtdo+A2ny/TQvxgzCzMErkF
 dl/g47SBV//2OoSpMtBYDgjSY7z7f2CJTh2wPjp0atWE2DDLLahZM8eX4h93fkPAq2NCSYPiM
 k9s3M92iT+t2GqW2aXA/89EdIWzyQtr+eVZCNIN+g+bT7HKqk/EuTUOCNZeBszInOb+E/G3/f
 xAMsMg6WWXQiflF9xxoSrJY7KE6dmt4yMN2GMhvBiIBOr9CjUUtGYzObItwCcAHYZ6+fWTltG
 /4JdahJPbWk5XwpyB01StwLm+yvulnO2gvrqA+YYw2Ko31vUrFCe1qOr/IB2unQoHVUBXzp+g
 AxC0M6z47zKZ62vVZOC90NyPiKPOymTFSH9wIVGQXVeEvZc+lDj9JzXmyRLJdlrFoAnzBmi/m
 PIaAOHrsR8j4g5GnmdP/FLjwOwz+BHRCgj2Luc9IMO/b8oGWlBfjlp29dQ2h7P0jAu6IfqYoN
 529l4v3FpYj9zkPU0RlqDfia2H6MDnMmtnQ8VufnYy0L0QH/UboM8p9fC/ZLwjLLdfGDrk/V1
 NTes5Qa9c1BwAa5gyf7MpwGaZYj905HMctWARVS6sh2Og76bYiJBnTPcgjG4kzVqtANX8hkfB
 syW/V4fcXMhHWIQr0jiQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 11 Jan 2021 11:11:39 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> > This almost works, speed is correct, but the last part is played twice=
.
>
> Oh yes, at the last IRQ, the push should be avoided.
> I guess that the code order should be changed to the following way:
>
>   1. advance the position for a period size
>   2. call snd_pcm_period_elapsed()
>   3. check if the stream is still running
>   4. copy the next chunk and update nextpos

This order gives correct pointer advancing etc, but now it's hitting a
new problem: the pcm core is reusing the buffer from under the audio
card. It's writing new data to the area that is currently being read by
DMA.

I assume the core expects DMA to be instant, but in this card's case
it's ondemand, reading bytes as needed.

By restoring the memcpy buffer, I get good audio with this new order
(sans occasional crackling due to the memcpy taking too long).

- Lauri
