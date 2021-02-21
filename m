Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B165320D21
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 20:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhBUTZN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Feb 2021 14:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhBUTZM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Feb 2021 14:25:12 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECDEC061574
        for <linux-mips@vger.kernel.org>; Sun, 21 Feb 2021 11:24:32 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id p3so1443668wmc.2
        for <linux-mips@vger.kernel.org>; Sun, 21 Feb 2021 11:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6yQFVXNdfKm8elSA/a+gXzdS0uQslSYqzPBoXICHr0w=;
        b=fpaYTWB23uz7X2sETkpwI6vrN6Uox9JSk85fAKlkN7YGm9KW/bXpwgX1D7X2M+Y+Zj
         /BGF/Wv1g0x68cOGneqpsQFM750+kHPJA7b8egXAaM9rhAfHF1qGLpUJMm7b8awGapEf
         xqa0Nd6ONGpkHXqry/GZHhk0Hn5qtV8WkNMkaD8d7bKEVgY9pEq5gkXz3hahu/YdEeCm
         xQvmdECJdWNUXVFtgrODxhRiIfXKIOTh3qypWXU3n55b+oMLldtGulxWt8OQee2IZnFA
         cAsQlsGSz8WGnpnQKVIWAQaKUSKB2FA8j/TuT2z0u/jnRE+pcoWx/bPNg4z9fPKxolqe
         rpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6yQFVXNdfKm8elSA/a+gXzdS0uQslSYqzPBoXICHr0w=;
        b=dzxd1IRLRzSjhjF4AR2/Zb0iXA8Wo5k0NbjuG8V2FK6rtawyQ1n5YWfnhqIfMFC1CR
         oeFTuu6ZxJ5sWPR7pGGsKRZQ17VnG7RHgUOb4JziZbyfqeafhi7k9BmYGdskyH5mvFb7
         RPY/msXmSfXIIzTOBbakTpvF8pK9RsmNoQuao5OYuq5UW6dVkt0vkKTQYC3GA7+Pl567
         JdrsWnYfTc+XLauPIjcGsP9HV/7ALQTToNpCBJNNovQYBLui39j6eGhDm92n2LRIH6GY
         jp6OaLs4jY0EI0Fsd+2cKQRbhHLsQuC0uX4FzNGNoyok52gCBJ5HVlaRhJuZ+TXu3SzF
         o0yg==
X-Gm-Message-State: AOAM533pW/EXuAD9sZ5AwFO8pLOjPppx0Q9s6saaJiI/MXws0ml5CaoH
        26/Kg8Q2QjgKtmvgI5oC188btnWSs4U=
X-Google-Smtp-Source: ABdhPJzCqqh/IR/qIBx36OJSr9PNvur6n2Bup2t7BhOu20nPQhMIOxGT9pjwKeQp8dGqxB/BIhPLhQ==
X-Received: by 2002:a05:600c:218b:: with SMTP id e11mr11197109wme.106.1613935468947;
        Sun, 21 Feb 2021 11:24:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id d15sm11067351wrb.43.2021.02.21.11.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 11:24:28 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
Subject: Re: KVM Guest
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-mips@vger.kernel.org,
        QEMU Developers <qemu-devel@nongnu.org>
References: <20210203123425.GA9574@alpha.franken.de>
 <a2a2cfe3-5618-43b1-a6a4-cc768fc1b9fb@www.fastmail.com>
 <20210207193952.GA21929@alpha.franken.de>
 <59a9a55c-2866-413f-89e3-b11e274c2d34@www.fastmail.com>
 <CAAhV-H6jkQBmr7+_GzUSAUhN035kCzNxoS30H_PdOpKzJO1JWA@mail.gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6266f24f-640d-b1e7-ffe6-e18babd10162@amsat.org>
Date:   Sun, 21 Feb 2021 20:24:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6jkQBmr7+_GzUSAUhN035kCzNxoS30H_PdOpKzJO1JWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On 2/9/21 2:32 AM, Huacai Chen wrote:
> I think it can be removed.
> 
> Huacai
> 
> On Tue, Feb 9, 2021 at 12:40 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> On Mon, Feb 8, 2021, at 3:39 AM, Thomas Bogendoerfer wrote:
>>> On Wed, Feb 03, 2021 at 08:52:34PM +0800, Jiaxun Yang wrote:
>>>> On Wed, Feb 3, 2021, at 8:34 PM, Thomas Bogendoerfer wrote:
>>>>> Hi,
>>>>>
>>>>> Does kvm guest kernel still work ? I'm playing with current mips-next
>>>>> and starting a kvm guest kernel inside an emulated malta system also
>>>>> running a mips-next kernel. The kvm guest kernel starts, but hangs
>>>>> in calibrate_delay (at least that's what info registers in qemu monitor
>>>>> suggests). Ayn ideas ?
>>>>
>>>> The current KVM guest kernel is actually a Trap-and-emul guest kernel.
>>>> VZ based KVM uses the same binary with the host one, so does TCG.
>>>>
>>>> TE KVM is current unmaintained. I'll try to get a malta and do some test.
>>>
>>> hmm, so it looks broken, is unmaintained, how about removing it ?
>>
>> Probably. I got remote access of a CoreLV malta but no luck to boot kernel as well.
>>
>> + Huacai as KVM/MIPS Maintainer.
>> + Philippe as QEMU/MIPS Maintainer.
>> + qemu-devel for wider audience.
>>
>> If nobody intended to maintain it probably it's time to remove it.

For QEMU the situation is:

commit 1fa639e5618029e944ac68d27e32a99dcb85a349
Author: James Hogan <jhogan@kernel.org>
Date:   Sat Dec 21 15:53:06 2019 +0000

    MAINTAINERS: Orphan MIPS KVM CPUs

    I haven't been active for 18 months, and don't have the hardware
    set up to test KVM for MIPS, so mark it as orphaned and remove
    myself as maintainer. Hopefully somebody from MIPS can pick this
    up.

commit 15d983dee95edff1dc4c0bed71ce02fff877e766
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Wed Jul 1 20:25:58 2020 +0200

    MAINTAINERS: Adjust MIPS maintainership (add Huacai & Jiaxun)

    Huacai Chen and Jiaxun Yang step in as new energy.

commit ca263c0fb9f33cc746e6e3d968b7db80072ecf86
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Wed Oct 7 22:37:21 2020 +0200

    MAINTAINERS: Remove myself

    I have been working on project other than QEMU for some time,
    and would like to devote myself to that project. It is impossible
    for me to find enough time to perform maintainer's duties with
    needed meticulousness and patience.


I don't have local hardware to test KVM. We have plan to add VZ testing
on Loongson hardware. For the rest I'll defer on Huacai and Jiaxun,
as long as it is useful to them, it is not a big burden for QEMU.

(IOW +1 for TE removal.)

Regards,

Phil.
