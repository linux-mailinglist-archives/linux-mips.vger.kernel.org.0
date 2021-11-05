Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1406044670B
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 17:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbhKEQet (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 12:34:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233613AbhKEQes (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Nov 2021 12:34:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AD3960ED7;
        Fri,  5 Nov 2021 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636129928;
        bh=dqYO0XzUwPNOkJ5l8PyhvzZqAKwTOsnYGLx7c5aZVRQ=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=qM/fG2i6LOkcRxe8dKJqlyHOGZYXZJLw+Di6HZONjtJHOuMTNuHd0DfcnS6C27jxX
         6wronV4yauGcwwCatN3CBOwcBJvw3PjqIIq0pTYXTIMjp8ywCjwi2h7qBWswegtCkw
         h0rY0njZkuw3TS/krXJz5XKmW9MxQOlDmC7X8AkLB4ZqswZa2ykIr+WQY90Do/hT55
         xfU31PI8fArm349i5UTD866xEr6od957ENnw+p0qnIGBY7i+hpTwX6k3UFnTzvtAYy
         6N0V54hRfOQ6+JMuiMW2tDqYlI0Z2itR/5nK04Q696SkZJCr6oWz3J9RIgKkA4dxZy
         aqjQjBVo+gRKw==
Message-ID: <7921f7c5e6e72f1eb4fa39d6a7c4d5d42380d000.camel@kernel.org>
Subject: Re: [PATCH 4/7] arch: Remove leftovers from mandatory file locking
From:   Jeff Layton <jlayton@kernel.org>
To:     Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        Steve French <sfrench@samba.org>,
        Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Date:   Fri, 05 Nov 2021 12:32:05 -0400
In-Reply-To: <20211105154334.1841927-5-alexandre.ghiti@canonical.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
         <20211105154334.1841927-5-alexandre.ghiti@canonical.com>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 2021-11-05 at 16:43 +0100, Alexandre Ghiti wrote:
> This config was removed so remove all references to it.
> 
> Fixes: f7e33bdbd6d1 ("fs: remove mandatory file locking support")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  arch/mips/configs/decstation_64_defconfig  | 1 -
>  arch/mips/configs/decstation_defconfig     | 1 -
>  arch/mips/configs/decstation_r4k_defconfig | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
> index 85f1955b4b00..e2ed105f8c97 100644
> --- a/arch/mips/configs/decstation_64_defconfig
> +++ b/arch/mips/configs/decstation_64_defconfig
> @@ -144,7 +144,6 @@ CONFIG_EXT2_FS_SECURITY=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT3_FS_POSIX_ACL=y
>  CONFIG_EXT3_FS_SECURITY=y
> -# CONFIG_MANDATORY_FILE_LOCKING is not set
>  CONFIG_ISO9660_FS=y
>  CONFIG_JOLIET=y
>  CONFIG_PROC_KCORE=y
> diff --git a/arch/mips/configs/decstation_defconfig b/arch/mips/configs/decstation_defconfig
> index 30a6eafdb1d0..7e987d6f5e34 100644
> --- a/arch/mips/configs/decstation_defconfig
> +++ b/arch/mips/configs/decstation_defconfig
> @@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT3_FS_POSIX_ACL=y
>  CONFIG_EXT3_FS_SECURITY=y
> -# CONFIG_MANDATORY_FILE_LOCKING is not set
>  CONFIG_ISO9660_FS=y
>  CONFIG_JOLIET=y
>  CONFIG_PROC_KCORE=y
> diff --git a/arch/mips/configs/decstation_r4k_defconfig b/arch/mips/configs/decstation_r4k_defconfig
> index e2b58dbf4aa9..6df5f6f2ac8e 100644
> --- a/arch/mips/configs/decstation_r4k_defconfig
> +++ b/arch/mips/configs/decstation_r4k_defconfig
> @@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT3_FS_POSIX_ACL=y
>  CONFIG_EXT3_FS_SECURITY=y
> -# CONFIG_MANDATORY_FILE_LOCKING is not set
>  CONFIG_ISO9660_FS=y
>  CONFIG_JOLIET=y
>  CONFIG_PROC_KCORE=y

Reviewed-by: Jeff Layton <jlayton@kernel.org>
