Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134293A5EF6
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 11:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbhFNJPj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 05:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhFNJPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 05:15:38 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B780C061574
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 02:13:35 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id k8so2281058lja.4
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aYrwM/2jwUEYL91iCCGN3QRwe93iFREWLi7YK2Py+GU=;
        b=DndfFDoSadgd8/18IL7VTtiyztAK1VzSL5+Z2xMk0oM3RUDcMo8RWUWuEi15Ak67ID
         izE8iIbFHkb70mWCENeYtNc2sTQE999kYWtFKwX+DB8p8W81c/EyryIzi9jXnWA0sI9k
         9aXyk5VCP06EeReSmSLO8Sx9wlRLrouR3WubiXPzN57hHSJuGN4BSiePz6xN9XlHGmuE
         CWby7QmrBbwHmVR0ly36iO/6O8bGp6nIPZOB+g0/4VZ68zyJ/YI+DJ/kev6HkQRMhu6z
         GU0bxA7G4dBfGwynJv4NOSvepcnYlYRETHvSF65MJEC+JXa+J/VImbBkUNF6Tvque5mp
         VQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aYrwM/2jwUEYL91iCCGN3QRwe93iFREWLi7YK2Py+GU=;
        b=AjMpwYHFHdAsGv+fxhlmySz1z7IXDcKgv83jCI1napwq9w0Bl1J//yeED4wuzO88D0
         nJ6c4pKgrzJ8Pg15SnvXVtW5QAVRlpUGZcQUjMzBCDroH3Bhw6dLg2JQ/G7bDTidLE09
         jWUWx4rtDLRtoVfKlsXlHdM7ji37tQ8Kh9L/uAmYSMfO8+yf17R51epmqgGJMHsdlc+p
         mErNlfQ3VyQldTc8OicsLkeeiUD6N+XNqQn4shsPoWEnW+vMB8bL+12L3ZE4G5o/WD65
         0g2UqT6hpxsYOXLmbtZ/hET8K/SasJetqb5leCqeceT/0kQ8nkO7+OlE/M3YRiRRKwSi
         i/nA==
X-Gm-Message-State: AOAM530P3vAKiPpRe3P1M/Bdc43Su8hNl3QRumYItNLU/gssMGYtT5o3
        ZoEy1NhcxnbYBq/YXrXUePk=
X-Google-Smtp-Source: ABdhPJyUeqlngHPpV66o7c5WUwajrHTu74m7xomcmHCD1Z0MrUt8ElzYiFCxiEDZG89iqJlphBd84Q==
X-Received: by 2002:a05:651c:179b:: with SMTP id bn27mr12572481ljb.424.1623662013865;
        Mon, 14 Jun 2021 02:13:33 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.25])
        by smtp.gmail.com with ESMTPSA id a15sm1413671lfm.54.2021.06.14.02.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 02:13:33 -0700 (PDT)
Subject: Re: [PATCH 1/3] MIPS: ralink: Define PCI_IOBASE
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-staging@lists.linux.dev
Cc:     gregkh@linuxfoundation.org, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
References: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
 <20210613155623.17233-2-sergio.paracuellos@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <12f81f6e-41be-7e0f-5590-67591c722a38@gmail.com>
Date:   Mon, 14 Jun 2021 12:13:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210613155623.17233-2-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 13.06.2021 18:56, Sergio Paracuellos wrote:

> PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> required by generic PCI drivers to make memory mapped I/O range
> work. Hence define it for ralink architectures to be able to
> avoid parsing manually IO ranges in PCI generic driver code.
> Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> call using '0xa0000000' as address, so use the same address in
> the definition to align things.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>   arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>   create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> 
> diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> new file mode 100644
> index 000000000000..ec58d4a9ed05
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MACH_RALINK_SPACES_H_
> +#define __ASM_MACH_RALINK_SPACES_H_
> +
> +#define PCI_IOBASE	_AC(0xa0000000, UL)
> +#define PCI_IOSIZE	SZ_16M
> +#define IO_SPACE_LIMIT  (PCI_IOSIZE - 1)

    Why this sudden switch to spaces for indentation? Previous lines were 
(correctly) indented with tabs...

> +
> +#include <asm/mach-generic/spaces.h>
> +#endif

MBR, Sergei
