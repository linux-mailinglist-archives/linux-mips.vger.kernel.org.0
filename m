Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493983D74B4
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 14:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhG0MDp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jul 2021 08:03:45 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:51596 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbhG0MDo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Jul 2021 08:03:44 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0F2942216C;
        Tue, 27 Jul 2021 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1627387424;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pZ/se20ZFFLCh/53BkKxRvZ5VxT5gHzNLD8jlsk8tBE=;
        b=FD5Hbxj7vPBg5jwc/kNydB0HPGIQWOAsOy5+uKVaTAsUhHfWGF+/cHgltvGHBXh4hZXftZ
        A2iXRbGtz5yMNuHJgSn+cZ5meTHFAPD9KtVyatz6A3Lf8QKqtbbv08Je3ZMWjPPeHHTZ9N
        IK3B1cjLe/Je4IadrmGKhinszIwH7TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1627387424;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pZ/se20ZFFLCh/53BkKxRvZ5VxT5gHzNLD8jlsk8tBE=;
        b=gh0jWmdnW/Dycuh81bP0Eie4zJ5AaobytWjgOro1VGMLOVrP/X7/tcC1Krwboy9zOHUk0N
        w/NAPyh3+ul3Q8CQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B26D3133DE;
        Tue, 27 Jul 2021 12:03:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id FSeSKB/2/2CjXgAAGKfGzw
        (envelope-from <pvorel@suse.cz>); Tue, 27 Jul 2021 12:03:43 +0000
Date:   Tue, 27 Jul 2021 14:03:42 +0200
From:   Petr Vorel <pvorel@suse.cz>
To:     zhanglianjie <zhanglianjie@uniontech.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] regen.sh: Limit mips o32 system calls
Message-ID: <YP/2HhUaQVQc1oAV@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20210722125219.31895-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722125219.31895-1-zhanglianjie@uniontech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi zhanglianjie,

> With mips architecture, 64-bit programs cannot call o32 system calls.
> For example, __NR_stime, __NR_socketcall, __NR_time, etc.
@Thomas or somebody from MIPS folks, could you please confirm this?

> Better solve the problem described in commit: 22c2c9e2f

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

> diff --git a/include/lapi/syscalls/regen.sh b/include/lapi/syscalls/regen.sh
> index 7a4f0cf44..8ac80440c 100755
> --- a/include/lapi/syscalls/regen.sh
> +++ b/include/lapi/syscalls/regen.sh
> @@ -80,7 +80,7 @@ for arch in $(cat "${srcdir}/order") ; do
>  		s390) echo "#if defined(__s390__) && !defined(__s390x__)" ;;
>  		mips_n32) echo "#if defined(__mips__) && defined(_ABIN32)" ;;
>  		mips_n64) echo "#if defined(__mips__) && defined(_ABI64)" ;;
> -		mips_o32) echo "#if defined(__mips__) && defined(_ABIO32)" ;;
> +		mips_o32) echo "#if defined(__mips__) && defined(_ABIO32) && _MIPS_SZLONG == 32" ;;
>  		*) echo "#ifdef __${arch}__" ;;
>  	esac
>  	while read line ; do
