Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEE71B9507
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 04:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgD0CIf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 22:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726084AbgD0CIf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 22:08:35 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52BFC061A0F;
        Sun, 26 Apr 2020 19:08:34 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h69so7969434pgc.8;
        Sun, 26 Apr 2020 19:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YqeGjbRkHRifTCZxJaGXA8PQirJ4wk+R8m4oliZtO60=;
        b=bhyxtfonS87CdrkvwBFz7qAvJHCPO6Rn/C3NENzutjkE0TyO2ONhgDJwj42DQ+0OZ2
         9iVUNYDH+SOjmdpAixY+DhgpBefl4GLAU4fwJfLKBzYzBKYC/9evYFL+oSYhVvO23E0/
         figzvrO3K1W4jY0XwRQo2HDjDjlcEpbqI/+0GXhsrNqEWzz1pAZS+s+5UQwdy3DPW+gI
         G2eUWmf+a2rh0l3BzRtGZHMlg6B3ei5Um2HMY8JIV+KVjFcD7EKEdjm/pn4q03W3gVzP
         U7zb2o54shedAYyTIFgu5bVLdEdNxoLxSUeR5mtERNR+NGhhbS9HadKwp7zfmDKf4t8a
         mELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YqeGjbRkHRifTCZxJaGXA8PQirJ4wk+R8m4oliZtO60=;
        b=cn398Vo4Jys4ax44cvsZk7MQwZWXIb7UQtGeuB3Cf1DhpzUjXI4A2B3pKfbbU0OgTO
         kMltV4VJvQK3VrLJYexRo4qqU+lBH+7dz92iOr5hmVoLvL2uMdKTgOUg5xY1qP1Tfkg9
         rxAy5PNqW8A0AHvDkuZBJaaJOjPaE6JPDirikure1Zsisp7OEIQBdqaUUYRRTRln1qRI
         U3mtbxdlASGh+UbXFtSpV0FHG7lNukTUvOp7VMIepDnbOvn/JSX+hEZ6cOdNcFlcUs0J
         dJHbsQryRdzxpJWPDBiwXNxiF5t1CGmhtY06LX83Mp+M9FfbqEbFXdBD3UOCnDLcRTHj
         oyvw==
X-Gm-Message-State: AGi0PuYoFqLR7s5Q0AiPm0Mzb7NWiWwWsfsHXmHv2kMeHn/CvIvMhbS4
        ch+ZYuZp7XWPYA4Me0JFias=
X-Google-Smtp-Source: APiQypIgoHEyUq1+TMBpUyg8ytGcXIuJu5TdZvBYUuJudAgiYk8L7e2CQv/p6vKvur6+C8wXxd9iPA==
X-Received: by 2002:a63:1510:: with SMTP id v16mr4873757pgl.17.1587953313922;
        Sun, 26 Apr 2020 19:08:33 -0700 (PDT)
Received: from Ryzen-7-3700X.localdomain ([45.152.182.77])
        by smtp.gmail.com with ESMTPSA id d29sm9179662pgm.83.2020.04.26.19.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 19:08:33 -0700 (PDT)
Date:   Sun, 26 Apr 2020 19:08:30 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200427020830.GA260@Ryzen-7-3700X.localdomain>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
 <20200423171807.29713-3-natechancellor@gmail.com>
 <20200426162737.GA9322@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426162737.GA9322@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 06:27:37PM +0200, Thomas Bogendoerfer wrote:
> On Thu, Apr 23, 2020 at 10:18:06AM -0700, Nathan Chancellor wrote:
> > Currently, the VDSO is being linked through $(CC). This does not match
> > how the rest of the kernel links objects, which is through the $(LD)
> > variable.
> 
> this causes build errors for me when (cross) compiling a big endian target:
> 
> target is little endian
> mips64-linux-gnu-ld: arch/mips/vdso/elf.o: endianness incompatible with that of the selected emulation
> mips64-linux-gnu-ld: failed to merge target specific data of file arch/mips/vdso/elf.o

Thanks for the report. I will look into it tomorrow and hopefully have a
v4 by then.

Cheers,
Nathan
